#!/bin/bash

while true
do

    case $(echo -e "up\ndown\nmute" |
        bemenu -p "volume $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2-)" -I ${index:-0}) in
        'up')
            index=0
            wpctl set-volume --limit 1.1 @DEFAULT_AUDIO_SINK@ 6%+ ;;

        'down')
            index=1
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;

        'mute')
            index=2
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;

        *)
            exit ;;
    esac

done
