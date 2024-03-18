#!/bin/bash

path="$HOME/Imágenes/screen/$(date +%y%m%d_%H%M%S%N).png"

sound()
{
    ffplay -nodisp -nostats -volume 70 -hide_banner -autoexit \
        "$HOME/.local/share/sounds/MacOS-Sounds-1.0/screen-capture.ogg"
}
case "$1" in
    -screen)
        shotgun -f png "$path" && sound
        ;;
    -window)
        shotgun -f png -i $(xdo id) "$path" && sound
        ;;
    *)
        exit 1
        ;;
esac
