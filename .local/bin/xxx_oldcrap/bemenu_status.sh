#!/bin/bash

data() {
    local battery=/sys/class/power_supply/BAT1
    echo $(< $battery/status) "$(< $battery/capacity)%"
  # date +"%d/%m %R hrs"
  
    echo 'Volume' $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100"%"}')
    echo 'Brightness' $(brightnessctl -m | cut -d',' -f4)
    swaymsg -t get_tree | jq -r '..|try select(.focused == true)|.name'
}

echo "$(data)"|bemenu -p "$(date +"%A %d %B %R hrs")"
