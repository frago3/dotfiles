#!/bin/bash


# swaymsg -t get_workspaces | jq '.[] | select(.focused==true) .representation'
# swaymsg -t get_workspaces | jq -c '.[] | .num,.focus'
# dunstify "" "$(swaymsg -t get_workspaces | jq -r '.[] | "\(.num) \(.focus) \(.focused)"')"
# workspaces=$(swaymsg -t get_workspaces | jq -r '.[] | "\(.num) \(.focus) \(.focused)"')

# [[ $workspaces =~ "[] true" ]] && exit

# dunstify "" "$workspaces"
# awk '
#     { w=$1; if(w > ++i) { s=i; exit } }
#     END { print s? s: ++w }' <<< "$workspaces"
#
#

# coretemp() {
#     echo CORETEMP
#     command ls -v1 $(grep -l 'coretemp' /sys/class/hwmon/hwmon*/name | cut -d/ -f1-5)/temp*_{label,input} |
#         xargs cat |
#         # xargs -I {} cat {} |
#         awk 'NR % 2 {val=$0; next} {printf "%-13s +%.1f°C\n", $0, val/1000}'
# }

# dunstify "" "$(coretemp)"
# coretemp

next() {
    expr $(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num') + 1
}
prev() {
    expr $(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num') - 1
}
[ $1 ]

case "$1" in
    -next) swaymsg "[con_id=__focused__]" move to workspace $(next), focus ;;
    -prev) swaymsg "[con_id=__focused__]" move to workspace $(prev), focus ;;
    *)
esac

