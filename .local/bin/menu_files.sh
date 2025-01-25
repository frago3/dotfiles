#!/bin/bash

killall -q bemenu && exit

while true
do

    file=$(echo -e "..\n$(command ls -pv --group-directories-first)" | bemenu -p "${PWD##*/}") || break

    case $(file --mime-type -Lb "$file") in

        inode/directory)
            cd "$file" ;;

        text/*|application/javascript|application/json)
            (emacs "$file" &); break ;;

        application/pdf)
            (zathura "$file" &); break ;;

        image/*)
            (imv-dir "$file" &); break ;;

        video/*)
            (mpv "$file" &); break ;;

        *)
            break ;;
    esac

done
