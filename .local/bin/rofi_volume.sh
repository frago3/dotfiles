#!/bin/bash

volume=$HOME/.local/bin/mkeys_volume

while true
do
    chosen=$(printf "Up\nDown\nMute" \
        | rofi -dmenu -p 'Volume  ' -i -select ${chosen:-'Up'})

    case $chosen in
        'Up')
            $volume -up
        ;;
        'Down')
            $volume -down
        ;;
        'Mute')
            $volume -mute
        ;;
        *)
            exit
        ;;
    esac
done
