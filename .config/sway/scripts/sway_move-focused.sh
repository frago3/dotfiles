#!/bin/bash

workspace=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

move(){
    swaymsg "[con_id=__focused__]" move to workspace $1, focus
}

case "$1" in
    -next)
        move $(expr $workspace + 1) ;;
    -prev)
        [ $workspace -lt 2 ] || move $(expr $workspace - 1) ;;
    *)
esac
