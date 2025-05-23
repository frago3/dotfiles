#!/bin/bash

capacity=$(< /sys/class/power_supply/BAT1/capacity)

if [ $(< /sys/class/power_supply/BAT1/status) = 'Discharging' ]
then
    [ $capacity -le 9 ] && notify-send -r 1 -u critical 'LOW BATTERY'
else
    [ $capacity -ge 85 ] && notify-send -r 1 -u critical 'FULL BATTERY'
fi

exit 0
