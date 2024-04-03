#!/bin/bash
# https://github.com/uniquepointer/polywins

class_format(){
    case $1 in
        'vlc.vlc') echo 'VLC' ;;
        'pcmanfm-qt.pcmanfm-qt') echo 'PCManfm' ;;
        'SoulseekQt.SoulseekQt') echo 'Soulseek' ;;
        *) echo ${1##*.} ;;
    esac
}
# get_active_window(){
#     xprop -root _NET_ACTIVE_WINDOW | awk '{ print substr($5,3,7) }'
# }

get_window_list()
{
    # local active_window_id=$1
    local active_window_id=$(xdo id | tr '[:upper:]' '[:lower:]')

    while read -r wm_id _ wm_class wm_name
    do
        wm_class=$(class_format $wm_class)

        [ "$wm_id" != "$active_window_id" ] && wm_class="%{F#808080}$wm_class%{F-}"

        printf "%s%s  %s" "%{A1:$0 wmctrl -ia $wm_id:}" "$wm_class" "%{A}"

    done < <(wmctrl -lx | grep "^..........  $(xdotool get_desktop)")

    echo 
}

if [ -z "$2" ]
then
    while read -r _; do
        get_window_list 
        # get_window_list ${active_window:2}
    done < <(xprop -root -spy _NET_CLIENT_LIST _NET_ACTIVE_WINDOW)
else
    "$@"
fi
