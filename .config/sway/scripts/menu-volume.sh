#!/bin/bash

while true
do

    case $(echo -e "up\ndown\nmute" |
        fuzzel -dp "volume $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2-) " --select=${index:-0}) in

        'up')
            index=up
            wpctl set-volume --limit 1.1 @DEFAULT_AUDIO_SINK@ 6%+ ;;

        'down')
            index=down
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;

        'mute')
            index=mute
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;

        *)
            exit ;;
    esac

done
