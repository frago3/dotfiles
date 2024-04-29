#!/bin/bash

echo "\
brightness.sh
dir.sh
power.sh
volume.sh
wifi.sh
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
            coproc $HOME/.config/sway/scripts/bemenu_$cmd ||
            coproc $cmd
}
