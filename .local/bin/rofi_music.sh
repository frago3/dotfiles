#!/bin/bash

music=$(ls -1d $HOME/Music/*)

chosen=$(echo "$music" | sed 's/.*\///' \
    | rofi -dmenu -i -p 'Albums  ' -theme-str 'listview { columns: 1; }') 

[ -n "$chosen" ] && {
    record=$(echo "$music" | awk -v c="$chosen" 'index($0, c) { print $0; exit }') 
    coproc (audacious "$record" > /dev/null 2>&1)
}
