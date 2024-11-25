#!/bin/bash

killall -q bemenu && exit

_find() {
    fd -cnever -e pdf . ~/Documentos/ &
    fd -cnever -td -d5 . ~/ &
}

file=$(_find | sort | cut -c10- | bemenu -p 'find') || exit

case "$(file --mime-type -Lb "$file")" in

    inode/directory)
        # cd "$file" && (pcmanfm-qt &)
        cd "$file" && (foot -T vifm vifm &)
        ;;

    application/pdf|application/epub+zip)
        (zathura "$file" &)
        ;;

    *) exit
        ;;
esac
