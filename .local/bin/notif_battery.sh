#!/bin/bash

level=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)

if [ "$status" = 'Discharging' ] && [ $level -le 6 ]
then
    dunstify --urgency=critical 'LOW BATTERY'
    # ffplay -nodisp -nostats -hide_banner -autoexit "/home/fj/.local/share/sounds/MacOS-Sounds-1.0/battery-low.ogg"

elif [ "$status" = 'Charging' ] && [ $level -ge 86 ]
then
    dunstify 'FULL BATTERY'
    # ffplay -nodisp -nostats -hide_banner -autoexit "$HOME/.local/share/sounds/MacOS-Sounds-1.0/bell.ogg"
fi
