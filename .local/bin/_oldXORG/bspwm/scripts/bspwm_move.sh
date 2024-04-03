#!/bin/bash

SCREEN_WIDTH=1918
SCREEN_HEIGHT=1057

x_pos(){
    xdotool getactivewindow getwindowgeometry --shell \
        | awk -F= -v w=$SCREEN_WIDTH '/WIDTH/ {print w - $2}' 
}
y_pos(){
    xdotool getactivewindow getwindowgeometry --shell \
        | awk -F= -v h=$SCREEN_HEIGHT '/HEIGHT/ {print h - $2}' 
}
xy_pos(){
    xdotool getactivewindow getwindowgeometry --shell \
        | awk -F= -v w=$SCREEN_WIDTH -v h=$SCREEN_HEIGHT '/WIDTH/{printf "%i ",w - $2} /HEIGHT/{print h - $2}' 
}
xy_pos_half(){
    xdotool getactivewindow getwindowgeometry --shell \
        | awk -F= -v w=$SCREEN_WIDTH -v h=$SCREEN_HEIGHT '/WIDTH/{printf "%i ",(w - $2)/2} /HEIGHT/{print (h - $2)/2}' 
}
move(){
    xdo move -x $1 -y $2
}
case $1 in
    -topleft)
        move 0 0 ;;
    -topright)
        move $(x_pos) 0 ;;
    -bottomleft)
        move 0 $(y_pos) ;;
    -bottomright)
        move $(xy_pos) ;;
    -center)
        move $(xy_pos_half) ;;
esac
