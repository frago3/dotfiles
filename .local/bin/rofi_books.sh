#!/bin/bash

bookspath=$HOME/Documentos/libros/

chosen=$(find $bookspath -type f -printf "%AD %AT %f\n" \
    | sort -nr \
    | cut -d ' ' -f 3- \
    | rofi -dmenu -i -p 'Books  ' -theme-str '* { width: 700; } listview { columns: 1; }')

[ -n "$chosen" ] && {
    bookname=$(find $bookspath -name "$chosen" -print -quit)
    coproc (xdg-open "$bookname" > /dev/null 2>&1)
}
