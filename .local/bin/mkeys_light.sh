#!/bin/bash
# Multimedia Keys

case $1 in
    -up)
        brightnessctl -q set +1% ;;
    -down)
        brightnessctl -qn set 1%- ;;
    -min)
        brightnessctl -q set 1 ;;
    -restore)
        brightnessctl -q set 6% ;;
    *)
        exit ;;
esac

dunstify --replace=4 --urgency=low "B $(brightnessctl g | awk '{ printf "%.2f\n", $0/1000 }')"
