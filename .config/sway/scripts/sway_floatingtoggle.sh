#!/bin/bash

[ "$(swaymsg -t get_tree | jq -r '..|try select(.focused == true) | .type')" == 'floating_con' ] &&
    swaymsg floating disable ||
    swaymsg floating enable, resize set width 1211 height 914
