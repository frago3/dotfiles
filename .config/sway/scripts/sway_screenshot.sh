#!/bin/bash

case "$1" in
    -screen)
        grim -co eDP-1 ;;
    -region)
        region=$(slurp 2>/dev/null) || exit
        grim -g "$region" ;;
    *)
esac
