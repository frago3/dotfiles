#!/bin/bash

volume=~/.config/hypr/scripts/mkeys_volume.sh

opts='up
down
mute'

while true
do
    chosen=$(echo "$opts" | bemenu -p 'volume' -I ${index:-0})

    case $chosen in
        'up') $volume -up ;;

        'down') $volume -down ;;

        'mute') $volume -mute ;;

        *) exit ;;
    esac

    index=$(awk "/$chosen/{print NR-1}" <<< "$opts")
done
