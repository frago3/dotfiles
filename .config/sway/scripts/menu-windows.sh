#!/bin/bash

swaymsg -t get_tree |
    jq -r '.. | objects | select(.type == "workspace") | "\(.name)   " + ( .. | objects | select(has("app_id")) | "\(.name)  \(.id)")' |
    fuzzel -dp 'windows ' |
    grep -oE '[^ ]+$' |
    xargs -r -I{} swaymsg "[con_id={}]" focus

