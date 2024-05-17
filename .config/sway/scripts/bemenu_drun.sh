#!/bin/bash

echo "\
brightness.sh
files.sh
find.sh
power.sh
volume.sh
wifi.sh
wallpaper.sh
foot
code
firefox
nwg-look
transmission-gtk
thunar
zathura" |
    sort | bemenu -p 'menu' | {
        
    IFS= read -r cmd

    [ "$cmd" ] && [[ "$cmd" =~ \.sh$ ]] &&
        ($HOME/.config/sway/scripts/bemenu_$cmd &) ||
        ($cmd &)
}
