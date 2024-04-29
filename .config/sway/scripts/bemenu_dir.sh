#!/bin/bash

while true
do
    file=$(echo -e "..\n$(command ls -pv --group-directories-first)" | bemenu -p "$PWD")

    case $(file --mime-type -Lb "$file") in

        inode/directory)
            cd "$file"
            ;;
        text/x-shellscript|text/plain|text/xml|application/javascript|application/json)
            coproc foot vi "$file"; break
            ;;
        image/*)
            coproc imv-dir "$file"; break
            ;;
        video/*)
            coproc mpv "$file" > /dev/null 2>&1; break
            ;;
        application/pdf)
            coproc zathura "$file" > /dev/null 2>&1; break
            ;;
        *)
            break
            ;;
    esac

done
