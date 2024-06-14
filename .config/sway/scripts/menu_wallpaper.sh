#!/bin/bash

while IFS= read -r line; do img=$line

    killall -q swaybg
    (swaybg -i "$img" -m tile &)

done < <(imv ~/.local/share/wallpapers/*)

[ "$img" ] && echo "output eDP-1 bg $img tile" > ~/.config/sway/config.d/55-swaybg.conf

