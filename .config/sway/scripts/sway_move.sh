#!/bin/bash

# SCREEN_WIDTH=1920
# SCREEN_HEIGHT=1080

x_pos(){
  swaymsg -t get_tree | jq -r '..|try select(.focused == true)|1920 - .rect.width'
}
y_pos(){
  swaymsg -t get_tree | jq -r '..|try select(.focused == true)|1080 - .rect.height'
}
xy_pos(){
  swaymsg -t get_tree | jq -r '..|try select(.focused == true)|.rect|"\(1920 - .width) \(1080 - .height)"'
}

move(){
  swaymsg move absolute position $1 px $2 px
}

case $1 in
  -topleft)       move 0 0 ;;
  -topright)      move $(x_pos) 0 ;;
  -bottomleft)    move 0 $(y_pos) ;;
  -bottomright)   move $(xy_pos) ;;
esac
