#!/bin/bash

# 1920x1080

x_pos(){
  i3-msg -t get_tree | jq -r '..|try select(.focused == true)|1920 - .rect.width'
}
y_pos(){
  i3-msg -t get_tree | jq -r '..|try select(.focused == true)|1061 - .rect.height'
}
xy_pos(){
  i3-msg -t get_tree | jq -r '..|try select(.focused == true)|.rect|"\(1920 - .width) \(1061 - .height)"'
}

move(){
  i3-msg -q move to position $1 $2
}

case $1 in
  -topleft)       move 0 0 ;;
  -topright)      move $(x_pos) 0 ;;
  -bottomleft)    move 0 $(y_pos) ;;
  -bottomright)   move $(xy_pos) ;;
esac
