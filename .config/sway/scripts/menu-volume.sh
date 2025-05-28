#!/bin/bash

while true
do

    index=$(echo -e "up\ndown\nmute" |
        fuzzel -dp "volume $(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | cut -d' ' -f2-) " --select-index=${index:-0} --index)
    case $index in

        0)
            wpctl set-volume --limit 1.1 @DEFAULT_AUDIO_SINK@ 6%+ ;;

        1)
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;

        2)
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;

        *)
            exit ;;
    esac

done
