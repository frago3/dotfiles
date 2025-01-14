#!/bin/bash

killall -q bemenu && exit

hyprctl clients -j | jq -r '.[] | "\(.workspace.name)  \(.title) \(.pid)"' | 
    sed 's/special://' | sort |
    bemenu -p 'windows' | grep -oE '[^ ]+$' |
    xargs -I{} hyprctl dispatch -q focuswindow "pid:{}"
