#!/bin/bash

get() {
    fd -cnever -e pdf -e mp4 -e png -e jpg . ~/ &
    fd -cnever -td -E node_modules . ~/ &
}

file=$( get|sort|bemenu -p 'find' ) || exit

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

    image/*)
        (imv-dir "$file" &)
        ;;

    video/*|audio/*)
        (mpv "$file" &)
        ;;

    *) exit
        ;;
esac
