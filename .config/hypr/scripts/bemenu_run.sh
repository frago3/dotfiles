#!/bin/bash

apps='books.sh
brightness.sh
power.sh
volume.sh
wifi.sh
code
firefox
foot
pcmanfm-qt
qbittorrent
qt5ct
qt6ct
vlc
zathura'

choosen=$(cut -d' ' -f1 <<< "$apps" | sort | bemenu -p 'menu')

[ -z "$choosen" ] && exit

[[ "$choosen" =~ \.sh$ ]] && sh $HOME/.config/hypr/scripts/bemenu_$choosen || coproc $choosen
