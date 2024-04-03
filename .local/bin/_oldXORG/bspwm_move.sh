#!/bin/bash

screen_width=1918
screen_height=1058

x_pos(){
    xdotool getactivewindow getwindowgeometry --shell \
        | awk -F= -v s_width=$screen_width '/WIDTH/ {print s_width - $2}' 
}
y_pos(){
    xdotool getactivewindow getwindowgeometry --shell \
        | awk -F= -v s_height=$screen_height '/HEIGHT/ {print s_height - $2}' 
}
case $1 in
    -left)
        xdo move -x 0 ;;
    -right)
        xdo move -x $(x_pos) ;;
    -top)
        xdo move -y 0 ;;
    -bottom)
        xdo move -y $(y_pos) ;;
    -topleft)
        xdo move -x 0 -y 0 ;;
    -topright)
        xdo move -x $(x_pos) -y 0 ;;
    -bottomleft)
        xdo move -x 0 -y $(y_pos) ;;
    -bottomright)
        xdo move -x $(x_pos) -y $(y_pos) ;;
    -centerhorz)
       xdo move -x $(( $(x_pos) / 2 )) ;;
    -centervert)
       xdo move -y $(( $(y_pos) / 2 )) ;;
esac
