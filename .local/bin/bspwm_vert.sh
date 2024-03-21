#!/bin/bash

L=1058
M=994
S=688

get_height(){
    xdotool getactivewindow getwindowgeometry --shell | awk -F = '/HEIGHT/ {print $2}'
}
set_height(){
    xdotool getactivewindow windowsize x $1
}

shrink()
{
    local current_height=$(get_height)
    
    if [ $current_height -gt $L ]; then
        set_height $L

    elif [ $current_height -gt $M ]; then
        set_height $M
    
    elif [ $current_height -gt $S ]; then
        set_height $S
    
    else
        exit 1
    fi
}
grow()
{
    local current_height=$(get_height)

    if [ $current_height -lt $S ]; then
        set_height $S

    elif [ $current_height -ge $S ] && [ $current_height -lt $M ]; then
        set_height $M

    elif [ $current_height -ge $M ] && [ $current_height -lt $L ]; then
        set_height $L
    
    else
        exit 1
    fi
}

case $1 in
    -shrink) shrink ;;
    -grow) grow ;;
    *) exit 1 ;;
esac
