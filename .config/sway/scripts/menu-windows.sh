#!/bin/bash

killall -q bemenu && exit
swaymsg -t get_tree |
jq -r '.. | objects | select(.type == "workspace") | "\(.name)   " + ( .. | objects | select(has("app_id")) | "\(.name)  \(.id)")' |
awk '{
        $1 == "__i3_scratch" && $1 = "J "
        print $0
}' |
bemenu -p 'windows' | grep -oE '[^ ]+$' | xargs -r -I{} swaymsg "[con_id={}]" focus
