#!/bin/bash
[ ! "$1" ] && exit

opt=$(echo -e "video\nno-video" | fzf)
        
case $opt in
    video)
        mpv --script-opts=ytdl_hook-try_ytdl_first=yes --msg-level=all=fatal "$1" ;;

    no-video)
        mpv --script-opts=ytdl_hook-try_ytdl_first=yes --no-video --msg-level=all=fatal "$1" ;;

    *)
        exit ;;
esac
