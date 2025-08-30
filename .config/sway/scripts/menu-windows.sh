#!/bin/bash

killall -q fuzzel && exit

swaymsg -t get_tree |
    jq -r '.. | objects | select(.type == "workspace") | "\(.name)   " + ( .. | objects | select(has("app_id")) | "\(.name)  \(.id)")' |
    # fuzzel --select=$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .name') -dp 'windows ' |
    fuzzel -dp 'windows ' |
    grep -oE '[^ ]+$' |
    xargs -r -I{} swaymsg "[con_id={}]" focus

