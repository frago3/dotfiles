#!/bin/bash

apps="\
brightness.sh
chromium
emacs
power.sh
pcmanfm-qt
qpwgraph
run.sh
wifi.sh
volume.sh
"

echo -en "$apps" | dmenu -p drun | {
        
    IFS= read -r cmd

    [[ "$apps" =~ "$cmd" ]] || exit
    
    [[ $cmd =~ \.sh$ ]] &&
        (menu-$cmd &) ||
        ($cmd &)
}
