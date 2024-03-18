#!/bin/bash

max=1058
mid=994
min=706

get_height(){
    xdotool getactivewindow getwindowgeometry --shell | awk -F = '/HEIGHT/ {print $2}'
}
set_height(){
    xdotool getactivewindow windowsize x $1
    # wmctrl -r :ACTIVE: -e 0,-1,-1,-1,$1
}


shrink()
{
    local current_height=$(get_height)
    
    if [ $current_height -gt $max ]; then
        set_height $max

    elif [ $current_height -gt $mid ]; then
        set_height $mid
    
    elif [ $current_height -gt $min ]; then
        set_height $min
    
    else
        exit 1
    fi
}
grow()
{
    local current_height=$(get_height)

    if [ $current_height -lt $min ]; then
        set_height $min

    elif [ $current_height -ge $min ] && [ $current_height -lt $mid ]; then
        set_height $mid

    elif [ $current_height -ge $mid ] && [ $current_height -lt $max ]; then
        set_height $max
    
    else
        exit 1
    fi
}

echo $(get_height)
case $1 in
    -shrink)
        shrink
        ;;
    -grow)
        grow
        ;;
    *)
        exit 1
        ;;
esac
