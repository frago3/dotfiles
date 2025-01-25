#!/bin/bash

workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

move(){
    i3-msg move container to workspace number $1, workspace $1
}

case "$1" in
    -next)
        move $(expr $workspace + 1) ;;
    -prev)
        [ $workspace -lt 2 ] || move $(expr $workspace - 1) ;;
    *)
esac
