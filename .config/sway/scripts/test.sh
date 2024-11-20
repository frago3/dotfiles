#!/bin/bash


# swaymsg -t get_workspaces | jq '.[] | select(.focused==true) .representation'
# swaymsg -t get_workspaces | jq -c '.[] | .num,.focus'
# dunstify "" "$(swaymsg -t get_workspaces | jq -r '.[] | "\(.num) \(.focus) \(.focused)"')"
workspaces=$(swaymsg -t get_workspaces | jq -r '.[] | "\(.num) \(.focus) \(.focused)"')

[[ $workspaces =~ "[] true" ]] && exit

dunstify "" "$workspaces"
# awk '
#     { w=$1; if(w > ++i) { s=i; exit } }
#     END { print s? s: ++w }' <<< "$workspaces"
