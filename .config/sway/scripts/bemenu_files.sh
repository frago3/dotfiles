#!/bin/bash

while true
do

    file=$(echo -e "..\n$(command ls -pv --group-directories-first)" | bemenu -p "$PWD") || break

    case $(file --mime-type -Lb "$file") in

        inode/directory)
            cd "$file" ;;

        text/*|application/javascript|application/json)
            (foot vi "$file" &); break ;;

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
