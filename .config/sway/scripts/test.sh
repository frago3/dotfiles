#!/bin/bash

# [ $(dunstctl count | awk '/displayed/ {print $3}') = 0 ] && ~/.local/bin/status_calendar.sh || dunstctl close
options="
ttorrent
pop
"
sed '/^$/d' <<< "$options" | bemenu
