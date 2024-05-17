#!/bin/bash

file=$( (fd -cnever . ~/ & fd -Hcnever . ~/.dotfiles/)|bemenu -p 'find') || exit

case "$(file --mime-type -Lb "$file")" in

    text/*|application/javascript|application/json)
        (foot -D "$(dirname $file)" vi "$file" &) ;;
    
    inode/directory)
        cd "$file"; (foot &) ;;

    application/pdf|application/epub+zip)
        (zathura "$file" &) ;;

    image/*)
        (imv-dir "$file" &) ;;

    video/*|audio/*)
        (mpv "$file" &) ;;

    *)
        exit ;;
esac
