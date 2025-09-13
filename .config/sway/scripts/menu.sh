#!/bin/bash

s=(~/.config/sway/scripts/menu-*)

printf '%s\n' ${s[@]##*/menu-} | fuzzel -d | {
    IFS="" read -r line
    [ $line ] && coproc (menu-$line)
}
