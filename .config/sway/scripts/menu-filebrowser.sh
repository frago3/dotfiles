#!/bin/bash

while true
do
    FILE="$(fd --color never | fuzzel -d --prompt="${PWD##*/} ")" || exit

    [ -e "$FILE" ] || exit

    case $(file --mime-type -Lb "$FILE") in
        inode/directory)
            cd "$FILE" ;;
        *)
            coproc $(xdg-open "$FILE") ; exit ;;
    esac
done

