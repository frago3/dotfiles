#!/bin/bash

FILE="$(fd --color never -E cva '\.(jpg|jpeg|png|pdf|epub)$' Documents/ Downloads/ Pictures/ Old/ | fuzzel -dp 'file ' )" || exit

case $(file --mime-type -Lb "$FILE") in
    */jpg|*/jpeg|*/png)
        coproc (imv-dir "$FILE")
        ;;
    */epub+zip|*/pdf)
        coproc (zathura "$FILE" 2> /dev/null)
        ;;
    *)
        exit
        ;;
esac


