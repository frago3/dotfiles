#!/bin/bash

case "$1" in
    -screen)
        grim -t jpeg -co eDP-1
        ;;
    -region)
        grim -t jpeg -g "$(slurp)" 2>/dev/null
        ;;
    -window)
        grim -t jpeg -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" 2>/dev/null
        ;;
    *)
        exit 1
        ;;
esac

