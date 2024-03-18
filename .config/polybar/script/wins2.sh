#!/bin/bash
# wmctrl -lx -> 1:win_id 2:desk_n 3:wm_class
get_window_list()
{
    wmctrl -lx | awk \
        -v active_win=$(xdo id | tr '[:upper:]' '[:lower:]') \
        -v active_desk=$(xdotool get_desktop) \
        -v on_click=$0 '
    BEGIN {
        class["vlc.vlc"] = "VLC"
        class["pcmanfm-qt.pcmanfm-qt"] = "PCManfm"
        class["SoulseekQt.SoulseekQt"] = "Soulseek"
    }
    
    $2 == active_desk {

        if (class[$3])
            $3 = class[$3]          
        else
            sub(/^.+\./, "", $3)

        if ($1 != active_win)
            $3 = "%{F#808080}"$3"%{F-}"
       
        windows = windows"%{A1:"on_click" "$1":}"$3"  %{A}"
    }
    
    END { print windows }'
}

if [ "$#" -eq 0 ]
then
    xprop -root -notype -spy _NET_CLIENT_LIST _NET_ACTIVE_WINDOW |
    while read -r _; do
        get_window_list 
    done
else
    xdo activate $1
fi
