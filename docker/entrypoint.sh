#!/bin/bash
set -e

if [ -f "/data/options.json" ]; then
    # Running inside Home Assistant Supervisor
    CONFIG_PATH=/data/options.json

    MODE=$(jq --raw-output '.mode // empty' "$CONFIG_PATH")
    LOG=$(jq --raw-output '.log // empty' "$CONFIG_PATH")

    if [ -f "/homeassistant/addons/neolink.toml" ]; then
        echo "Migrating '/homeassistant/addons/neolink.toml' to '/addon_configs/a14d3924_neolink-latest/neolink.toml'"
        cp /homeassistant/addons/neolink.toml /config/
        mv /homeassistant/addons/neolink.toml /homeassistant/addons/neolink.toml.migrated
    fi

    echo "--- VERSIONS ---"
    echo "App version: 0.1.1"
    echo -n "neolink version: " && neolink --version
    echo "neolink mode: ${MODE}"
    echo "neolink log: ${LOG}"
    echo "ATTENTION: if you expected a newer Neolink version, please reinstall this App!"
    echo "--- Neolink ---"

    case $LOG in
      debug)
        export RUST_LOG="neolink=debug"
        ;;
      info)
        export RUST_LOG="neolink=info"
        ;;
      warn)
        export RUST_LOG="neolink=warn"
        ;;
      error)
        export RUST_LOG="neolink=error"
        ;;
      *)
        echo -n "Unknown log level"
        ;;
    esac

    case $MODE in
      rtsp)
        exec neolink rtsp --config /config/neolink.toml
        ;;

      mqtt)
        exec neolink mqtt --config /config/neolink.toml
        ;;

      dual)
        exec neolink mqtt-rtsp --config /config/neolink.toml
        ;;

      *)
        echo "Unknown mode option: ${MODE}" >&2
        exit 1
        ;;
    esac
else
    # Running as a standard Docker container
    MODE="${NEO_LINK_MODE:-rtsp}"

    echo "--- VERSIONS ---"
    echo -n "neolink version: " && neolink --version
    echo "neolink mode: ${MODE}"
    echo "--- Neolink ---"

    exec neolink "${MODE}" --config /etc/neolink.toml
fi
