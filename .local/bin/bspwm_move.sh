#!/bin/bash

screen_width=1918
screen_height=1058

get_width(){
    xdotool getactivewindow getwindowgeometry --shell | awk -F = '/WIDTH/ {print $2}'
}
get_height(){
    xdotool getactivewindow getwindowgeometry --shell | awk -F = '/HEIGHT/ {print $2}'
}

case $1 in
    -left)
        xdo move -x 0 ;;
    -right)
        xdo move -x $(( screen_width - $(get_width) )) ;;
    -top)
        xdo move -y 0 ;;
    -bottom)
        xdo move -y $(( screen_height - $(get_height) )) ;;
    -topleft)
        xdo move -x 0 -y 0 ;;
    -topright)
        xdo move -x $(( screen_width - $(get_width) )) -y 0 ;;
    -bottomleft)
        xdo move -x 0 -y $(( screen_height - $(get_height) )) ;;
    -bottomright)
        xdo move -x $(( screen_width - $(get_width) )) -y $(( screen_height - $(get_height) )) ;;
    -centerhorz)
        xdo move -x $(( (screen_width - $(get_width)) / 2 )) ;;
    -centervert)
        xdo move -y $(( (screen_height - $(get_height)) / 2 )) ;;
esac

