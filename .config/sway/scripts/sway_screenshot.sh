#!/bin/bash

case "$1" in
    -screen)
        grim -co eDP-1 ;;
    -region)
        region=$(slurp 2>/dev/null) && grim -g "$region" ;;
    *)
esac
