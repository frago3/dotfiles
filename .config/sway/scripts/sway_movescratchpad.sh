#!/bin/bash

[ "$(swaymsg -t get_tree|jq -r '..|try select(.focused == true)|.type')" == 'floating_con' ] &&
  swaymsg move scratchpad, scratchpad show ||
  swaymsg floating enable, move scratchpad, scratchpad show
