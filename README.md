# Neolink

![CI](https://github.com/QuantumEntangledAndy/neolink/workflows/CI/badge.svg)
[![dependency status](https://deps.rs/repo/github/QuantumEntangledAndy/neolink/status.svg)](https://deps.rs/repo/github/QuantumEntangledAndy/neolink)

Neolink is a small program that acts as a proxy between Reolink IP cameras and
normal RTSP clients.
Certain cameras, such as the Reolink B800, do not implement ONVIF or RTSP, but
instead use a proprietary "Baichuan" protocol only compatible with their apps
and NVRs (any camera that uses "port 9000" will likely be using this protocol).
Neolink allows you to use NVR software such as Shinobi or Blue Iris to receive
video from these cameras instead.
The Reolink NVR is not required, and the cameras are unmodified.
Your NVR software connects to Neolink, which forwards the video stream from the
camera.

The Neolink project is not affiliated with Reolink in any way; everything it
does has been reverse engineered.

## This Fork

This fork is an extension of
[thirtythreeforty's](https://github.com/thirtythreeforty/neolink) with additional
features not yet in upstream master.

**Major Features**:

- MQTT
- Motion Detection
- Paused Streams (when no rtsp client or no motion detected)
- Save a still image to disk

**Minor Features**:

- Improved error messages when missing gstreamer plugins
- Protocol more closely follows official reolink format
  - Possibly can handle more simulatenous connections
- More ways to connect to the camera. Including Relaying through reolink
  servers
- Camera battery levels can be displayed in the log

## Installation

Download from the
[release page](https://github.com/QuantumEntangledAndy/neolink/releases)

Extract the zip

Install the latest [gstreamer](https://gstreamer.freedesktop.org/download/)
(1.20.5 as of writing this).

- **Windows**: ensure you install `full` when prompted in the MSI options.
- **Mac**: Install the dpkg version on the official gstreamer website over
  the brew version
- **Ubuntu/Debian**: These packages should work

```bash
sudo apt install \
  libgstrtspserver-1.0-0 \
  libgstreamer1.0-0 \
  libgstreamer-plugins-bad1.0-0 \
  gstreamer1.0-x \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-bad \
  libssl
```

- **Windows**: You may also need to
  [install openssl](https://wiki.openssl.org/index.php/Binaries)
- **Macos**: You may also need to
  [install openssl](https://wiki.openssl.org/index.php/Binaries) or
  `brew install openssl@1.1`
- **Ubuntu/Debian**: Install the `libssl` package

Make a config file see below.

## Config/Usage

### RTSP

To use `neolink` you need a config file.

There's a more complete example
[here](https://github.com/QuantumEntangledAndy/neolink/blob/master/sample_config.toml),
but the following should work as a minimal example.

```toml
bind = "0.0.0.0"

[[cameras]]
name = "Camera01"
username = "admin"
password = "password"
uid = "ABCDEF0123456789"

[[cameras]]
name = "Camera02"
username = "admin"
password = "password"
uid = "BCDEF0123456789A"
address = "192.168.1.10"
```

Create a text file called `neolink.toml` in the same folder as the
neolink binary. With your config options.

When ready start `neolink` with the following command
using the terminal in the same folder the neolink binary is in.

```bash
./neolink rtsp --config=neolink.toml
```

#### Configuration reference

The tables below list every supported `neolink.toml` option currently parsed by
Neolink.

##### Top-level options

| Key | Default | Allowed values / aliases | Description |
| --- | --- | --- | --- |
| `bind` | `"0.0.0.0"` |  | Address the RTSP server binds to. |
| `bind_port` | `8554` | `0`-`65535` | Port the RTSP server listens on. |
| `tokio_console` | `false` |  | Enables the Tokio console config flag. |
| `certificate` | unset |  | Path to a PEM file containing the server certificate and private key for RTSP TLS. |
| `tls_client_auth` | `"none"` | `none`, `request`, `require` | Controls whether RTSP clients must present a TLS certificate. |
| `[mqtt]` | disabled |  | Enables MQTT support and defines the MQTT broker connection. |
| `[[users]]` | none |  | Optional RTSP users for authenticated stream access. |
| `[[cameras]]` | required |  | Defines each camera served by Neolink. |

##### `[mqtt]`

| Key | Default | Allowed values / aliases | Description |
| --- | --- | --- | --- |
| `broker_addr` | required | alias: `server` | Hostname or IP address of the MQTT broker. |
| `port` | required |  | MQTT broker port. |
| `credentials` | unset | `["username", "password"]` | Optional MQTT username/password pair. |
| `ca` | unset |  | Optional CA certificate path for MQTT TLS. |
| `client_auth` | unset | `["client-cert.pem", "client-key.pem"]` | Optional MQTT client certificate/key pair. This cannot be set together with `ca`. |

##### `[[users]]`

| Key | Default | Allowed values / aliases | Description |
| --- | --- | --- | --- |
| `name` | required | alias: `username` | RTSP username. `anyone` and `anonymous` are reserved names. |
| `pass` | unset | alias: `password` | RTSP password for this user. |

##### `[[cameras]]`

| Key | Default | Allowed values / aliases | Description |
| --- | --- | --- | --- |
| `name` | required |  | Camera name. This is also used in RTSP paths and MQTT topics. |
| `address` | unset |  | Camera address, typically `host:9000`. |
| `uid` | unset |  | Camera UID for discovery-based connections. At least one of `address` or `uid` must be set. |
| `username` | required |  | Camera login username. |
| `password` | unset | alias: `pass` | Camera login password. |
| `stream` | `All` | `none`, `all`, `both`, `main`/`mainStream`/`mainstream`/`MainStream`, `sub`/`subStream`/`substream`/`SubStream`, `extern`/`externStream`/`externstream`/`ExternStream` | Selects which RTSP streams Neolink serves for the camera. |
| `permitted_users` | unset |  | Limits RTSP access for this camera to the listed `[[users]]`. |
| `channel_id` | `0` | alias: `channel`; `0`-`31` | Selects the NVR channel for multi-camera devices. |
| `[cameras.mqtt]` | enabled with defaults |  | Per-camera MQTT feature flags and timers. |
| `[cameras.pause]` | disabled with defaults |  | Pause behavior when there is no motion or client activity. |
| `discovery` | `relay` | `none`, `local`, `remote`, `map`, `relay`, `cellular` | Controls which UID discovery methods are allowed. |
| `max_encryption` | `"Aes"` | `None`, `Aes`, `BcEncrypt` (case-insensitive) | Highest encryption mode Neolink will try when connecting to the camera. |
| `strict` | `false` |  | Fails the media stream immediately when unexpected media packets are received. |
| `print_format` | `None` | alias: `print`; `None`, `Human`, `Xml` | Prints camera status payloads in the selected format. |
| `update_time` | `false` | alias: `time` | Forces the camera date/time to be updated when it connects. |
| `buffer_duration` | `3000` | aliases: `duration`, `buffer`; `1`-`15000` ms | Target media buffer duration in milliseconds. |
| `enabled` | `true` | alias: `enable` | Enables or disables the camera entirely. |
| `debug` | `false` | alias: `verbose` | Logs decrypted XML traffic for troubleshooting. |
| `use_splash` | `true` | alias: `splash` | Shows a generated splash stream while the real stream is unavailable. |
| `splash_pattern` | `snow` | alias: `pattern`; `smpte`, `snow`, `black`, `white`, `red`, `green`, `blue`, `checkers-1`, `checkers-2`, `checkers-4`, `checkers-8`, `circular`, `blink`, `smpte75`, `zone-plate`, `gamut`, `chroma-zone-plate`, `solid-color`, `ball`, `smpte100`, `bar`, `pinwheel`, `spokes`, `gradient`, `colors`, `smpte-rp-219` | GStreamer test pattern used for the splash stream. |
| `max_discovery_retries` | `10` | aliases: `retries`, `max_retries` | Maximum UID discovery retry attempts. |
| `push_notifications` | `false` | aliases: `push`, `push_noti` | Enables push-notification support for cameras that support it. |
| `idle_disconnect` | `false` | aliases: `idle`, `idle_disc` | Disconnects from the camera while idle to reduce battery use. |

##### `[cameras.mqtt]`

| Key | Default | Allowed values / aliases | Description |
| --- | --- | --- | --- |
| `enable_motion` | `true` |  | Publishes motion status over MQTT. |
| `enable_light` | `true` |  | Enables MQTT control/status handling for flood lights where supported. |
| `enable_battery` | `true` |  | Publishes battery level updates. |
| `battery_update` | `2000` | minimum `500` ms | Battery polling/publish interval in milliseconds. |
| `enable_preview` | `true` |  | Publishes preview images over MQTT. |
| `preview_update` | `2000` | minimum `500` ms | Preview publish interval in milliseconds. |
| `enable_floodlight` | `true` |  | Publishes floodlight task status where supported. |
| `floodlight_update` | `2000` | minimum `500` ms | Floodlight task status publish interval in milliseconds. |
| `[cameras.mqtt.discovery]` | disabled |  | Home Assistant MQTT discovery settings for this camera. |

##### `[cameras.mqtt.discovery]`

| Key | Default | Allowed values / aliases | Description |
| --- | --- | --- | --- |
| `topic` | required |  | MQTT discovery root topic, such as `homeassistant`. |
| `features` | required | `floodlight`/`light`, `camera`/`preview`/`Preview`, `motion`/`md`/`pir`, `led`, `ir`, `reboot`, `pt`, `battery`/`power`, `siren`/`alarm` | Home Assistant entities to publish for the camera. |

##### `[cameras.pause]`

| Key | Default | Allowed values / aliases | Description |
| --- | --- | --- | --- |
| `on_motion` | `false` |  | Pauses the stream when no motion is detected. |
| `on_disconnect` | `false` | alias: `on_client` | Pauses the stream when there are no active RTSP clients. |
| `motion_timeout` | `1.0` | alias: `timeout` | Delay, in seconds, before pausing after motion stops. |
| `mode` | `"none"` | `black`, `still`, `test`, `none` | What Neolink serves while the camera is paused. |

### Discovery

To connect to a camera using a UID we need to find the IP address of the camera
with that UID

The IP is discovered with four methods

1. Local discovery: Here we send a broadcast on all visible networks asking
   the local network if there is a camera with this UID. This only works if
   the network supports broadcasts

   If you know the ip address you can put it into the `address` field of the
   config and attempt a direct connection without broadcasts. This requires a
   route from neolink to the camera.

2. Remote discovery: Here we ask the reolink servers what the IP address is.
   This requires that we contact reolink and provide some basic information
   like the UID. Once we have this information we connect directly to the
   local IP address. This requires a route from neolink to the camera and
   for the camera to be able to contact reolink.

3. Map discovery: In this case we register our IP address with reolink and ask
   the camera to connect to us. Once the camera either polls/recieves a connect
   request from the reolink servers the camera will initiate a connection
   to neolink. This requires that our IP and reolink are reachable from
   the camera.

4. Relay: In this case we request that reolink relay our connection. Neolink
   nor the camera need to be able to direcly contact each other. But both
   neolink and the camera need to be able to contact reolink.

This can be controlled with the config

```toml
discovery = "local"
```

In the `[[cameras]]` section of the toml.

Possible values are `local`, `remote`, `map`, `relay` later values implictly
enable prior methods.

#### Cellular

Cellular cameras should select `"cellular"` which only enables `map` and
`relay` since `local` and `remote` will always fail

```toml
discovery = "cellular"
```

See the sample config file for more details.

### MQTT

To use mqtt you will need to adjust your config file as such:

```toml
bind = "0.0.0.0"

[mqtt]
broker_addr = "127.0.0.1" # Address of the mqtt server
port = 1883 # mqtt servers port
credentials = ["username", "password"] # mqtt server login details

[[cameras]]
name = "Camera01"
username = "admin"
password = "password"
uid = "ABCDEF0123456789"
```

Then to start the mqtt+rtsp connection run the following:

```bash
./neolink mqtt-rtsp --config=neolink.toml
```

OR for only mqtt

```bash
./neolink mqtt --config=neolink.toml
```

Neolink will publish these messages:

Messages that are prefixed with `neolink/`

- `/status` Tracks the connection of neolink, `connected` for ready `offline`
  for not ready this is a LastWill message
- `/config` The configuration file used to start neolink, you can publish to
  this to **temporarily** alter the live configuration
- `/config/status` If you publish to `/config` then any errors from your
  publish config will show here, or `Ok(())` if no errors and finished loading

Messages that are prefixed with `neolink/{CAMERANAME}`

Control messages:

- `/control/led [on|off]` Turns status LED on/off
- `/control/ir [on|off|auto]` Turn IR lights on/off or automatically via light
  detection
- `/control/reboot` Reboot the camera
- `/control/ptz [up|down|left|right|in|out] (amount)` Control the PTZ
  movements, amount defaults to 32.0
- `/control/ptz/preset [id]` Move the camera to a PTZ preset
- `/control/ptz/assign [id] [name]` Set the current PTZ position to a preset ID
  and name
- `/control/zoom (amount)` Zoom the camera to the specified amount. Example: 1.0
  for normal and 3.5 for 3.5x zoom factor. This only works on cameras that support
  zoom
- `/control/pir [on|off]`
- `/control/floodlight [on|off]` Turns floodlight (if equipped) on/off
- `/control/floodlight_tasks [on|off]` Turns floodlight (if equipped) tasks on/off
  This is the automatic tasks such as on motion and night triggers
- `/control/wakeup (mins)` For cameras that are using `idle_disconnect` this will
  force a wakeup for at least the given minutes
- `/control/siren on` Signal the siren, the message is always "on" as there is no
  "off" signal for the siren

Status Messages:

- `/status disconnected` Sent when the camera goes offline
- `/status/battery` Sent in reply to a `/query/battery` an XML encoded version
  of the battery status
- `/status/battery_level` A simple % value of current battery level, only
  published when `enable_battery` is true in the config
- `/status/pir` Sent in reply to a `/query/pir` an XML encoded version of the
  pir status
- `/status/motion` Contains the motion detection alarm status. `on` for motion
  and `off` for still, only published when `enable_moton` is true in the config
- `/status/ptz/preset` Sent in reply to a `/query/ptz/preset` an XML encoded
  version of the PTZ presets
- `/status/preview` a base64 encoded camera image updated every 2s. Not
  every camera supports the snapshot command needed for this. In such cases
  there will be no `/status/preview` message. Only published when
  `enable_preview` is true in the config
- `/status/floodlight_tasks` The current status of the floodlight tasks
  used updated every 2s by default

Query Messages:

- `/query/battery` Request that the camera reports its battery level
- `/query/pir` Request that the camera reports its pir status
- `/query/ptz/preset` Request that the camera reports its PTZ presets
- `/query/preview` Request that the camera post a base64 encoded jpeg
  of the stream to `/status/preview` now, ignoring the timer

### Controlling RTSP from MQTT

If neolink is started with `mqtt-rtsp` then the `/neolink/config` can be used
to control the RTSP

Changes made to the config by publishing to `/neolink/config` should be
reflected in the rtsp

These include changing the:

- Available users

```toml
[[users]]
  name = "me"
  pass = "mepass"
```

- Permitted users on a camera

```toml
[[cameras]]
  permitted_users = [ "me" ]
```

- Available streams

```toml
[[cameras]]
  stream = "Main"
```

Setting a value of `None` will disable the stream

- Disable the entire camera (mqtt updates and all)

```toml
[[cameras]]
  enabled = false
```

### MQTT Disable Features

Certain features like preview and motion detection may not be desired
you can disable them with the following config options.
Disabling these may help to conserve battery

```toml
bind = "0.0.0.0"

[mqtt]
broker_addr = "127.0.0.1" # Address of the mqtt server
port = 1883 # mqtt servers port
credentials = ["username", "password"] # mqtt server login details

[[cameras]]
name = "Camera01"
username = "admin"
password = "password"
uid = "ABCDEF0123456789"
[cameras.mqtt]
enable_motion = false        # motion detection
                             # (limited battery drain since it
                             # is a passive listening connection)
                             #
enable_light = false         # flood lights only available on some camera
                             # (limited battery drain since it
                             # is a passive listening connection)
                             #
enable_battery = false       # battery updates in `/status/battery_level`
                             #
enable_preview = false       # preview image in `/status/preview`
                             #
enable_floodlight = false    # preview image in `/status/floodlight_tasks`
                             #
battery_update = 2000        # Number of ms between `/status/battery_level` updates
                             #
preview_update = 2000        # Number of ms between `/status/preview` updates
                             #
floodlight_update = 2000     # Number of ms between `/status/floodlight_tasks` updates
```

#### MQTT Discovery

[MQTT Discovery](https://www.home-assistant.io/integrations/mqtt/#mqtt-discovery)
is partially supported. Currently, discovery is opt-in and camera features
must be manually specified.

```toml
[cameras.mqtt]
  # <see above>
  [cameras.mqtt.discovery]
  topic = "homeassistant"
  features = ["floodlight"]
```

Available features are:

- `floodlight`: This adds a light control to home assistant
- `camera`: This adds a camera preview to home assistant. It is only updated
  every 0.5s and cannot be much more than that since it is updated over mqtt
  not over RTSP. Not every camera supports the snapshot command needed for
  this. In such cases there will be no `/status/preview` message.
- `led`: This adds a switch to chage the LED status light on/off to home
  assistant
- `ir`: This adds a selection switch to chage the IR light on/off/auto to home
  assistant
- `motion`: This adds a motion detection binary sensor to home assistant
- `reboot`: This adds a reboot button to home assistant
- `pt`: This adds a selection of buttons to control the pan and tilt of the
  camera
- `battery`: This adds a battery level sensor to home assistant
- `siren`: Adds a siren button to home assistant

### Extra Camera Settings

Listed below are extra camera settings:

```toml
[[cameras]]
name = "Camera01"
username = "admin"
password = "password"
uid = "ABCDEF0123456789"
debug = false # Displays Debug XML messages from camera
enabled = true # Enable or Disable the camera
update_time = false # When camera connects, force the setting of the camera date/time to now. The default is false
print_format = "None"  # Type of format that logs are displayed in (None, Human, Xml). The default is None
```

- **Debug:** Will dump the various XMLs from the camera as they are recieved
and decrypted. Leave this off unless asked for it to fix an issue.

- **Enabled:** Useful if you want to remove a camera from rtsp without deleting
it from the config

- **update_time:** Used to FORCE an update on the camera time. Usually it checks
if it is needed but this
will force it regardless. (Mostly this was introduced to address a specific
ssue a user had)

- **print_format:** Used for adjusting printing of some values mostly, battery
messages

### Pause

To use the pause feature you will need to adjust your config file as such:

```toml
bind = "0.0.0.0"

[[cameras]]
name = "Camera01"
username = "admin"
password = "password"
uid = "ABCDEF0123456789"
  [cameras.pause]
  on_motion = true # Should pause when no motion
  on_client = true # Should pause when no rtsp client
  timeout = 2.1 # How long to wait after motion stops before pausing
```

Then start the rtsp server as usual:

```bash
./neolink rtsp --config=neolink.toml
```

### Idle Disconnects

To really save battery we need to disconnect the camera when it is idle.

To acheieve this you can add `idle_disconnect = true` to the `[[cameras]]`
section

```toml
bind = "0.0.0.0"

[[cameras]]
name = "Camera01"
username = "admin"
password = "password"
uid = "ABCDEF0123456789"
idle_disconnect = true
[cameras.pause]
  on_client = true # Should pause when no rtsp client
  timeout = 2.1 # How long to wait after motion stops before pausing
```

When `idle_disconnect = true` neolink will disconnect from the camera 30s
after it stops being used.

Neolink considers it as being used if there is an active stream running, or
if there is motion being detected or an mqtt command being run

[Because google remove the api for the push notifications we cannot
reliably use push notifications to wake up, so motion won't wake
up neolink anymore]

You can make neolink stop active streams when there are no rtsp clients using

```toml
[cameras.pause]
  on_client = true # Should pause when no rtsp client
```

Once in the disconnected state. Neolink will stay disconnected until there is a
new requested activation such as a client connecting or an mqtt command

~Neolink will also wake up on push notifications from the camera. These are usually
sent by the camera on motion or PIR alarms. To disable this you can set
`push_notifications = false` in the `[[cameras]]` config~

[Google removed the apis we were using for push notifications]

### Docker

[Docker](https://hub.docker.com/r/quantumentangledandy/neolink) builds are also
provided in multiple architectures. The latest tag tracks master while each
branch gets it's own tag.

```bash
docker pull quantumentangledandy/neolink

# Add `-e "RUST_LOG=debug"` to run with debug logs
#
# --network host is only needed if you require to connect
# via local broadcasts. If you can connect via any other
# method then normal bridge mode should work fine
# and you can ommit this option. Not all OSes support
# network=host, notably macos lacks this option.
docker run --network host --volume=$PWD/config.toml:/etc/neolink.toml quantumentangledandy/neolink
```

#### Environmental Variables

There are currently 2 environmental variables available as part of the container:

- `NEO_LINK_MODE`: defaults to `"rtsp"` if not set, other options are "mqtt" or "mqtt-rtsp".
- `NEO_LINK_PORT`: defaults to `8554`, set this to your required port value.

### Image

You can write an image from the stream to disk using:

```bash
neolink image --config=config.toml --file-path=filepath CameraName
```

Where filepath is the path to save the image to and CameraName is the name of
the camera from the config to save the image from.

File is always jpeg and the extension given in filepath will be added or changed
to reflect this.

Some cameras do not support the SNAP command that is used to generate the image
on the camera. If this is the case with your camera you can try the
`--use-stream` option which will instead create a jpeg by transcoding the video
stream.

### Battery Levels

You can get the battery level and status using

```bash
neolink battery --config=config.toml CameraName
```

This will produce an xml formatted battery status on stdout for processing

### PIR

You can control pir using

```bash
neolink pir --config=config.toml CameraName [on|off]
```

This will turn the PIR on or off

### Reboot

You can reboot a camera using

```bash
neolink reboot --config=config.toml CameraName
```

### Status LED

You can control the status LED using

```bash
neolink status-light --config=config.toml CameraName [on|off]
```

### Talk

You can talk over the camera using

```bash
neolink talk --config=config.toml --adpcm-file=data.adpc\
               --sample-rate=16000 --block-size=512 CameraName
```

Where the sounds is ADPCM encoded

or

```bash
neolink talk --config=config.toml --microphone  CameraName
```

Which uses the default microphone which depends on
[gstreamer](https://gstreamer.freedesktop.org/documentation/autodetect/autoaudiosrc.html?gi-language=c#autoaudiosrc-page)

### PTZ

You can control the PTZ using

```bash
neolink ptz --config=config.toml CameraName control 32 [left|right|up|down|in|out]
```

Where 32 is the speed. Not all cameras support speed

Some cameras also support preset positions

```bash
# Print the list of preset positions
neolink ptz --config=config.toml CameraName preset
# Move the camera to preset ID 0
neolink ptz --config=config.toml CameraName preset 0
# Save the current position as preset ID 0 with name PresetName
neolink ptz --config=config.toml CameraName assign 0 PresetName
```

To change the zoom level use the following:

```bash
# Zoom the camera to 2.5x
neolink ptz --config=config.toml CameraName zoom 2.5
```

With 1.0 being normal and 2.5 being 2.5x zoom

## License

Neolink is free software, released under the GNU Affero General Public License
v3.

This means that if you incorporate it into a piece of software available over
the network, you must offer that software's source code to your users.

## Donations

If you find this code helpful please consider supporting development.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/G2G5HOYIZ)
