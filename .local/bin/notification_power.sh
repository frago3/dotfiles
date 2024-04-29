#!/bin/bash

level=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)

if [ "$status" = 'Discharging' ] && [ $level -le 6 ]
then
    dunstify --urgency=critical 'LOW BATTERY'


elif [ "$status" = 'Charging' ] && [ $level -ge 86 ]
then
    dunstify 'FULL BATTERY'

fi
