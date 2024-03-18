#!/bin/bash

max=1867
mid=1300
min=958


get_width(){
    xdotool getactivewindow getwindowgeometry --shell | awk -F = '/WIDTH/ {print $2}'
}

set_width(){
    xdotool getactivewindow windowsize $1 y
}

shrink()
{
    local current_width=$(get_width)

    if [ $current_width -gt $max ]; then
        set_width $max

    elif [ $current_width -gt $mid ]; then
        set_width $mid
    
    elif [ $current_width -gt $min ]; then
        set_width $min
    
    else
        exit 1
    fi
}

grow()
{
    local current_width=$(get_width)
    
    if [ $current_width -ge $mid ] && [ $current_width -lt $max ]; then
        set_width $max

    elif [ $current_width -ge $min ] && [ $current_width -lt $mid ]; then
        set_width $mid
    
    elif [ $current_width -lt $min ]; then
        set_width $min
    
    else
        exit 1
    fi
}
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
