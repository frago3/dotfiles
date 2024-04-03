#!/bin/bash

wins=$(hyprctl clients | awk \
   '/^Window / { addr = $2 }
    /^	workspace: [[:digit:]] / { i = $2 }
    /^	class: / { w = $2 }
    /^	title: / { $1 = " -"; w = w$0" "addr }
    /^	focusHistoryID: / { i = i$2; ws[i] = w }
    END { for(i in ws) print i"  "ws[i] }')

choosen=$(sed 's/ [a-z0-9]*$//' <<< "$wins" | bemenu -p 'windows')
[ -z "$choosen" ] && exit

last=$(grep -e "^$choosen" <<< "$wins" | awk '{print $NF}')

hyprctl --batch "dispatch focuswindow address:0x$last;dispatch alterzorder top,address:0x$last" > /dev/null 2>&1
