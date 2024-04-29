#!/bin/bash

case $1 in
    -up)
        wpctl set-volume --limit 1.1 @DEFAULT_AUDIO_SINK@ 6%+ ;;
    -down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    -mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    *)
        exit ;;
esac

dunstify --replace=4 --urgency=low "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
