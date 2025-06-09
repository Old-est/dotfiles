#!/bin/bash

APP_ID="foot-dropdown"

# Ищем PID окна foot с нужным app-id
PID=$(hyprctl clients -j | jq -r --arg app "$APP_ID" '.[] | select(.initialClass == $app) | .pid')

if [ -n "$PID" ]; then
    kill "$PID"
else
    foot -c ~/.config/foot/foot-dropdown.ini &
fi

