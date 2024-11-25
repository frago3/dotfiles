#!/bin/bash

killall -q bemenu && exit

apps="\
brightness.sh
code
emacs
foot
firefox
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
        ($HOME/.config/sway/scripts/bemenu_$cmd &) ||
        ($cmd &)
}
