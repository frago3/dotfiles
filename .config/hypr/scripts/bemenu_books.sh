#!/bin/bash

bookspath=$HOME/Documentos/libros/

chosen=$(find $bookspath -type f -printf "%AD %AT %f\n" \
    | sort -nr -t"/" -k3 -k1 -k2 | cut -d ' ' -f 3- \
    | bemenu -p 'books')

[ -z "$chosen" ] && exit

bookname=$(find $bookspath -name "$chosen" -print -quit)
coproc (zathura "$bookname" > /dev/null 2>&1)
