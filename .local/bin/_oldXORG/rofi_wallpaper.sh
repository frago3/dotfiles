#!/bin/bash

path="$HOME/Imágenes/windows"

while true
do
    selected=$(nsxiv -qto $path -n ${n:-1})

    [ -z "$selected" ] && break

    feh --bg-tile "$selected"
    
    n=$(ls -1 "$path" | awk -v f="$(basename "$selected")" 'f == $0 { print NR; exit }')
done
