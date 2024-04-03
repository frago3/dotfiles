#!/bin/bash

SCREEN_WIDTH=1919
SCREEN_HEIGTH=1058

move() { 
    hyprctl dispatch moveactive exact $1 $2 > /dev/null 2>&1
}
x_pos() {
    hyprctl activewindow | awk -v w=$SCREEN_WIDTH \
        '/size/ {sub(/,.*/, "", $2); print w - $2}'
}
y_pos() {
    hyprctl activewindow | awk -v h=$SCREEN_HEIGTH \
        '/size/ {sub(/.*,/, "", $2); print h - $2}'
}
xy_pos() {
    hyprctl activewindow | awk -v w=$SCREEN_WIDTH -v h=$SCREEN_HEIGTH \
        '/size/ {split($2,size,","); printf "%i %i\n", w - size[1], h - size[2]}'
}
case $1 in
    -righttop)      move $(x_pos) 1 ;;
    -leftbottom)    move 1 $(y_pos) ;;
    -rightbottom)   move $(xy_pos) ;;
esac
