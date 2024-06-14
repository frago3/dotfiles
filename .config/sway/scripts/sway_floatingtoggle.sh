#!/bin/bash

[ "$(swaymsg -t get_tree | jq -r '..|try select(.focused == true) | .type')" == 'floating_con' ] &&
  swaymsg floating disable || swaymsg floating enable
