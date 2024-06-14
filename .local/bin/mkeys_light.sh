#!/bin/bash

case $1 in
    -up)        value=$(brightnessctl -m set +1%) ;;
    -down)      value=$(brightnessctl -mn set 1%-) ;;
    -min)       value=$(brightnessctl -m set 1) ;;
    -restore)   value=$(brightnessctl -m set 6%) ;;
    *)          exit ;;
esac

dunstify -r 1 -u low "Brightness: $(cut -d, -f4 <<< $value)"
