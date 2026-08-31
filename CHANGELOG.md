# Changelog

## [0.8.3-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.8.2-rc.3...neolink-v0.8.3-rc.3) (2026-08-31)


### Bug Fixes

* avoid clearing bin before returning None and fix iterator invalidation in clear_bin ([a17fbab](https://github.com/pacorreia/neolink/commit/a17fbab7ea75f0fed31a07d85260490a09553909))
* avoid clearing bin before returning None and fix iterator invalidation in clear_bin ([df4b2aa](https://github.com/pacorreia/neolink/commit/df4b2aaa2ce97a4e269cbca885c4ba74c30072e8))

## [0.8.2-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.8.1-rc.3...neolink-v0.8.2-rc.3) (2026-08-30)


### Bug Fixes

* improve camera connection resilience and error handling ([e75c3f1](https://github.com/pacorreia/neolink/commit/e75c3f1d62043631f3547d511becc29e854c66f2))
* improve camera connection resilience and error handling ([398c980](https://github.com/pacorreia/neolink/commit/398c980873f7c0c1bc493a90afc08630f95b1f39))

## [0.8.1-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.8.0-rc.3...neolink-v0.8.1-rc.3) (2026-08-29)


### Bug Fixes

* Update README.md ([0b7ac98](https://github.com/pacorreia/neolink/commit/0b7ac9811b9b902eecf589279a94d0719c408433))

## [0.8.0-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.16-rc.3...neolink-v0.8.0-rc.3) (2026-08-28)


### Features

* detect HA context in entrypoint.sh and branch accordingly ([25a5aa2](https://github.com/pacorreia/neolink/commit/25a5aa20d6a4b8d48e61427b8c8872c3964df063))
* detect HA context in entrypoint.sh and branch accordingly ([c793905](https://github.com/pacorreia/neolink/commit/c7939057a0b48ae3db9f32d075eed3951ae09015))


### Documentation

* add neolink config reference ([677858f](https://github.com/pacorreia/neolink/commit/677858f87c51119a5f5e52e5b89143e4c715afd0))

## [0.7.16-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.15-rc.3...neolink-v0.7.16-rc.3) (2026-08-27)


### Bug Fixes

* use spawn_blocking instead of std::thread::spawn to fix tokio reactor panic ([2cb69be](https://github.com/pacorreia/neolink/commit/2cb69bec42aaa9ea3b3d1b7b97dae38e8bc8de06))

## [0.7.15-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.14-rc.3...neolink-v0.7.15-rc.3) (2026-08-27)


### Bug Fixes

* correct spelling of 'separate' in factory.rs comments ([d15376f](https://github.com/pacorreia/neolink/commit/d15376fbbc1e5f29a33a5c335cd7aa40c84bd894))
* prevent GLib GWakeup FD leak when camera subscription starves ([7041f8a](https://github.com/pacorreia/neolink/commit/7041f8ad76440d4deec81bdca19906cf0d5c0166))
* prevent GLib GWakeup FD leak when RTSP clients reconnect ([abc650d](https://github.com/pacorreia/neolink/commit/abc650d6587f0baa2fea88e236b84a2e1d931cb0))

## [0.7.14-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.13-rc.3...neolink-v0.7.14-rc.3) (2026-08-27)


### Bug Fixes

* prevent BcConnection Poller deadlock and clean up dead discovery handlers ([a091669](https://github.com/pacorreia/neolink/commit/a0916696f13593da14f9e9b85126bd2bd57a46a9))
* prevent BcConnection Poller deadlock and clean up dead discovery handlers ([48064c4](https://github.com/pacorreia/neolink/commit/48064c4235c980fa52e011c62a8674ea9a478015))

## [0.7.13-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.12-rc.3...neolink-v0.7.13-rc.3) (2026-08-27)


### Bug Fixes

* exit feeder thread on NULL state and stop pipeline on disconnect to prevent FD leak ([83fdfd3](https://github.com/pacorreia/neolink/commit/83fdfd3e06db1cec601ede047868f3b04bb85ec9))
* exit feeder thread on NULL state and stop pipeline on disconnect to prevent FD leak ([b45de4e](https://github.com/pacorreia/neolink/commit/b45de4e7958b90ab429a731b456701db5267f86e))

## [0.7.12-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.11-rc.3...neolink-v0.7.12-rc.3) (2026-08-26)


### Bug Fixes

* propagate FlowError::Eos so pipeline tears down cleanly on client disconnect ([b0c474f](https://github.com/pacorreia/neolink/commit/b0c474fc0ffe1754c0b9428e20336095d50cc2ec))

## [0.7.11-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.10-rc.3...neolink-v0.7.11-rc.3) (2026-08-26)


### Bug Fixes

* handle FlowError::Eos silently and broaden gst_poll assertion suppression ([18d1be4](https://github.com/pacorreia/neolink/commit/18d1be48c4b2386ea1e51d781d0d9edd76b109f0))
* handle FlowError::Eos silently and broaden gst_poll assertion suppression ([5131ee8](https://github.com/pacorreia/neolink/commit/5131ee81c0efdfe13517824ffb299335b1c56b21))
* suppress gst_poll_read_control CRITICAL assertion on pipeline teardown ([35d7ece](https://github.com/pacorreia/neolink/commit/35d7eceeb8b1a0a1fcd44a76bbe17aee92afd098))

## [0.7.10-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.9-rc.3...neolink-v0.7.10-rc.3) (2026-08-26)


### Bug Fixes

* keep GStreamer log handler alive by using std::mem::forget on LogHandlerId ([bdcf24f](https://github.com/pacorreia/neolink/commit/bdcf24fcc468a1902d3203567b72dc096bcf5696))
* prevent immediate unregistration of GStreamer CRITICAL log handler ([d04d99e](https://github.com/pacorreia/neolink/commit/d04d99e3a29f1535343aa8f3273945df6b5a8397))

## [0.7.9-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.8-rc.3...neolink-v0.7.9-rc.3) (2026-08-26)


### Bug Fixes

* disable push notifications by default; suppress benign GStreamer gst_poll assertion ([d6d0ec0](https://github.com/pacorreia/neolink/commit/d6d0ec0156c29dc059e28165b6661cd5b35bc4f3))
* disable push notifications by default; suppress benign GStreamer gst_poll assertion ([364bc4d](https://github.com/pacorreia/neolink/commit/364bc4def25562dd8f84a0e138c4b45e4710b9ea))

## [0.7.8-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.7-rc.3...neolink-v0.7.8-rc.3) (2026-08-26)


### Bug Fixes

* reformat long log::debug! line in factory.rs to pass rustfmt check ([baa3654](https://github.com/pacorreia/neolink/commit/baa36548fd6b57f396a2438d8eea261d6dcb14b2))

## [0.7.7-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.6-rc.3...neolink-v0.7.7-rc.3) (2026-08-26)


### Bug Fixes

* Address review feedback on buffer pool error logging, Flushing log message, and push_notifications default ([6b7cad3](https://github.com/pacorreia/neolink/commit/6b7cad35bfc1749be3a8f32aa408c1d78302a829))
* Change push_notifications default to false; handle buffer pool exhaustion and WrongState ([7b5cb65](https://github.com/pacorreia/neolink/commit/7b5cb65beb460d9b9031e8288822e6c7a6965047))
* clamp RTSP video timestamp fps divisor ([6b77410](https://github.com/pacorreia/neolink/commit/6b77410735a30532fdeaef8a0e8e629851fb9186))
* Restore RTSP stream playback for Home Assistant ([b922399](https://github.com/pacorreia/neolink/commit/b92239939df303783376a3586291847a59084ea5))
* Restore RTSP stream playback for Home Assistant ([aab4c2c](https://github.com/pacorreia/neolink/commit/aab4c2ced4dfd9dbc725bdb8690602d81bfdc7bc))

## [0.7.6-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.5-rc.3...neolink-v0.7.6-rc.3) (2026-08-26)


### Bug Fixes

* Update Dockerfile ([b3b373b](https://github.com/pacorreia/neolink/commit/b3b373bfc67adc59c8add5a57b0ae2561f372d86))

## [0.7.5-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.4-rc.3...neolink-v0.7.5-rc.3) (2026-08-26)


### Bug Fixes

* Update Dockerfile ([70370f8](https://github.com/pacorreia/neolink/commit/70370f82cd5ab8a50de55a5d4344e95aec0c98d9))

## [0.7.4-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.3-rc.3...neolink-v0.7.4-rc.3) (2026-08-26)


### Bug Fixes

* Update Dockerfile ([42787f5](https://github.com/pacorreia/neolink/commit/42787f579cca72d4c17c60392b2b06be78673db5))

## [0.7.3-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.2-rc.3...neolink-v0.7.3-rc.3) (2026-08-26)


### Bug Fixes

* use semantic version from Cargo.toml as Docker image tag instead of branch name ([f39c846](https://github.com/pacorreia/neolink/commit/f39c846d5818a44a594f87a54b7be8d4c12a5919))
* use semantic version from Cargo.toml as Docker image tag instead of branch name ([d384822](https://github.com/pacorreia/neolink/commit/d384822366a492c7e8b6e7cf244b4af596dd9054))

## [0.7.2-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.1-rc.3...neolink-v0.7.2-rc.3) (2026-08-25)


### Bug Fixes

* quote secret variable and guard docker push when tags are empty ([5fccc21](https://github.com/pacorreia/neolink/commit/5fccc21a4d558beb8bf043fa14c2ef2f60d3cbe7))
* quote secret variable and guard docker push when tags are empty ([0dc7d91](https://github.com/pacorreia/neolink/commit/0dc7d91b60ff337d9a0af38c9f96815e3982f161))

## [0.7.1-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.7.0-rc.3...neolink-v0.7.1-rc.3) (2026-08-25)


### Bug Fixes

* use github.ref to detect version tags for docker image tagging ([b9bac5c](https://github.com/pacorreia/neolink/commit/b9bac5cb2f38964d3d2b61f73cdcfd49063bd844))
* use github.ref to detect version tags for docker image tagging ([a03bb47](https://github.com/pacorreia/neolink/commit/a03bb47f18cc154c0927f03a82bdc715d68534a8))

## [0.7.0-rc.3](https://github.com/pacorreia/neolink/compare/neolink-v0.6.3-rc.3...neolink-v0.7.0-rc.3) (2026-08-25)


### Features

* add support for running neolink in k8s. add related documentation. ([b13db12](https://github.com/pacorreia/neolink/commit/b13db1227d9754a81bb9fca196e5f638b8ee81cf))


### Bug Fixes

* downgrade frame-drop log to debug, fix buffer_size formula for ~125ms ([ce23596](https://github.com/pacorreia/neolink/commit/ce235961c9ce212e50e3a21cf99f5f820d042225))
* **rtsp:** eliminate buffering latency and restore UDP transport ([ea29e81](https://github.com/pacorreia/neolink/commit/ea29e81094db25dc9fc455e35c9b91e408fe29f6))
* **rtsp:** reduce stream latency and improve UDP transport support ([5073aa6](https://github.com/pacorreia/neolink/commit/5073aa6809658ffd88e0f7e82b6a93a497778b69))
