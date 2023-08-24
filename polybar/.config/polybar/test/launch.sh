#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if xrandr | grep "eDP connected" &> /dev/null;
then
    polybar main -c ~/.config/polybar/test/config.ini &
fi

if xrandr | grep "HDMI-1-0 connected" &> /dev/null;
then
    polybar external -c ~/.config/polybar/test/config.ini &
fi

if xrandr | grep "HDMI-0 connected" &> /dev/null;
then
    polybar main -c ~/.config/polybar/test/config_nvidia.ini &
    polybar external -c ~/.config/polybar/test/config_nvidia.ini &
fi
