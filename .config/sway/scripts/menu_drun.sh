#!/bin/bash

killall -q bemenu && exit

apps="\
brightness.sh
chromium
code
emacs
foot
power.sh
pcmanfm-qt
qbittorrent
qpwgraph
run.sh
volume.sh
wifi.sh
"

echo -en "$apps" | bemenu -p 'menu' | {
        
    IFS= read -r cmd

    [ $cmd ] && [[ $cmd =~ \.sh$ ]] &&
        ($HOME/.config/sway/scripts/menu_$cmd &) ||
        ($cmd &)
}
