#!/bin/bash

#!/bin/bash

handle() {
    case "$1" in
    activelayout*)
        layout=$(echo "$1" | awk -F',' '{print $NF}')

        if [[ "$layout" == Russian* ]]; then
            echo '{"class": "ru", "text": "RU"}'
        else
            echo '{"class": "en", "text": "EN"}'
        fi
        ;;
    esac
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
    while read -r line; do
        handle "$line"
    done
