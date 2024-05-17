#!/bin/bash

# capacity=$(< /sys/class/power_supply/BAT1/capacity)
# dunstify "Battery $capacity%"
# [ $capacity -le 9 ] && dunstify -u critical 'LOW BATTERY' || 
#     [ $capacity -ge 85 ] && dunstify 'FULL BATTERY'
dunstify -r 1 -u critical 'Low Battery'
# case "$1" in
#     -low)   dunstify -r 1 -u critical 'Low Battery' ;;
#     *)      exit ;;
# esac
