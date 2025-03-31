#!/bin/bash

killall -q fuzzel && exit
swaymsg -t get_tree |
jq -r '.. | objects | select(.type == "workspace") | "\(.name)   " + ( .. | objects | select(has("app_id")) | "\(.name)  \(.id)")' |
# awk '{ $1 == "__i3_scratch" && $1 = "S "; print $0 }' |
fuzzel -dp 'windows ' |
grep -oE '[^ ]+$' | xargs -r -I{} swaymsg "[con_id={}]" focus
