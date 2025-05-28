#!/bin/bash

killall -q fuzzel && exit

s=(~/.config/sway/scripts/menu-*)

printf '%s\n' ${s[@]##*/menu-} | fuzzel -d | {
    IFS="" read -r line
    [ $line ] && coproc (menu-$line)
}
