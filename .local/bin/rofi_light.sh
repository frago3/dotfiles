#!/bin/bash

bright=$HOME/.local/bin/mkeys_light

while true
do
    chosen=$(printf 'Increase\nDecrease\nMinimum\nRestore' \
        | rofi -dmenu -p 'Brightness  ' -i -select ${chosen:-'Increase'})

    case $chosen in
        'Increase')
            bright -up
        ;;
        'Decrease')
            bright -down
        ;;
        'Minimum')
            bright -min
        ;;
        'Restore')
            bright -restore
        ;;
        *)
            exit
        ;;
    esac
done
