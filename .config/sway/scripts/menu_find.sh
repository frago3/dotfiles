#!/bin/bash

killall -q bemenu && exit

_find() {
    fd -cnever -e pdf . ~/Documentos/ &
    fd -cnever -td -d5 . ~/ &
}

file=$(_find | sort | cut -c10- | bemenu -p 'find') || exit

case "$(file --mime-type -Lb "$file")" in

    # text/*|application/javascript|application/json)
    #     (foot -D "$(dirname $file)" vi "$file" &)
    #     ;;

    inode/directory)
        cd "$file" && (pcmanfm-qt &)
        ;;

    application/pdf|application/epub+zip)
        (zathura "$file" &)
        ;;

    # image/*)
    #     (imv-dir "$file" &)
    #     ;;

    # video/*|audio/*)
    #     (mpv "$file" &)
    #     ;;

    *) exit
        ;;
esac
