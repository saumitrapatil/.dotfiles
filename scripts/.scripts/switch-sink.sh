#!/bin/bash

current_sink=$(pactl info | grep 'Default Sink' | awk '{print $3}')
analog_serial=$(pactl list short sinks | grep 'analog' | awk '{print $1}')
hdmi_serial=$(pactl list short sinks | grep 'hdmi' | awk '{print $1}')

if [[ "$current_sink" == *"hdmi"* ]]; then
	notify-send "Switched sink to Analog"
    pactl set-default-sink $analog_serial
else
	notify-send "Switched sink to HDMI"
    pactl set-default-sink $hdmi_serial
fi
