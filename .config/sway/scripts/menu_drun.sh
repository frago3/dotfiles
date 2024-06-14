#!/bin/bash

echo "\
brightness.sh
code
foot
power.sh
run.sh
volume.sh
wifi.sh" | bemenu -p 'menu' | {
        
    IFS= read -r cmd

    [ "$cmd" ] && [[ "$cmd" =~ \.sh$ ]] &&
        ($HOME/.config/sway/scripts/menu_$cmd &) ||
        ($cmd &)
}
