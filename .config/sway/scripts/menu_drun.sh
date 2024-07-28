#!/bin/bash

killall -q bemenu ||
echo "\
brightness.sh
code
foot
power.sh
qbittorrent
run.sh
volume.sh
wifi.sh" |
bemenu -p 'menu' | {
        
    IFS= read -r cmd

    [ $cmd ] && [[ $cmd =~ \.sh$ ]] &&
        ($HOME/.config/sway/scripts/menu_$cmd &) ||
        ($cmd &)
}
