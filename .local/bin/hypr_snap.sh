#!/bin/bash

# 1920x1080

x_pos(){
  hyprctl activewindow | awk '/size:/{split($2, size, ",");print 1920 - size[1]}'
}
y_pos(){
  hyprctl activewindow | awk '/size:/{split($2, size, ",");print 1060 - size[2]}'
}
xy_pos(){
  hyprctl activewindow | awk '/size:/{split($2, size, ",");print 1920 - size[1], 1060 - size[2]}'
}

move(){
  hyprctl dispatch -q moveactive exact $1 $2
}

case $1 in
  -topleft)       move 0 0 ;;
  -topright)      move $(x_pos) 0 ;;
  -bottomleft)    move 0 $(y_pos) ;;
  -bottomright)   move $(xy_pos) ;;
esac
