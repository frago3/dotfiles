#!/bin/bash

XL=1918
L=1867
M=1300
S=960

get_width(){
    xdotool getactivewindow getwindowgeometry --shell | awk -F = '/WIDTH/ {print $2}'
}
set_width(){
    xdotool getactivewindow windowsize $1 y
}

shrink()
{
    local current_width=$(get_width)

    if [ $current_width -gt $XL ]; then
        set_width $XL

    elif [ $current_width -gt $L ]; then
        set_width $L

    elif [ $current_width -gt $M ]; then
        set_width $M

    elif [ $current_width -gt $S ]; then
        set_width $S

    else
        exit 1
    fi
}

grow()
{
    local current_width=$(get_width)

    if [ $current_width -ge $L ] && [ $current_width -lt $XL ]; then
        set_width $XL

    elif [ $current_width -ge $M ] && [ $current_width -lt $L ]; then
        set_width $L

    elif [ $current_width -ge $S ] && [ $current_width -lt $M ]; then
        set_width $M

    elif [ $current_width -lt $S ]; then
        set_width $S

    else
        exit 1
    fi
}

case $1 in
    -shrink) shrink ;;
    -grow) grow ;;
    *) exit 1 ;;
esac
