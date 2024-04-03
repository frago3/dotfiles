#!/bin/bash

last=$(hyprctl clients \
    | awk '/^Window /{printf "%s ",$2} /^	workspace: [[:digit:]] /{print $2}' \
    | grep " $(hyprctl activeworkspace | awk '/^workspace ID/ {print $3}')$" \
    | sed -n 'x;$p' | cut -d' ' -f1)

hyprctl --batch "dispatch focuswindow address:0x$last;dispatch alterzorder top,address:0x$last" > /dev/null 2>&1
