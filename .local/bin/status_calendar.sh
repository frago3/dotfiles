#!/bin/bash

get_calendar()
{

    local today calendar

    calendar=$(cal --monday|sed '/^[[:space:]]*$/d')
    today=$(date '+%e'|tr -d ' ')

    if [ "$today" -gt 1 ]
    then
        sed -E -e "s/\b($(seq -s '|' $((today - 1))))\b/<span foreground='grey'>&<\/span>/g" \
           -e "s/\b$today\b/<span background='lightgrey' foreground='black'>&<\/span>/" <<< "$calendar"
    else
        sed -e "s/\b$today\b/<span background='lightgrey' foreground='black'>&<\/span>/" <<< "$calendar"
    fi

}

dunstify -r 1 '' "$(get_calendar)"
