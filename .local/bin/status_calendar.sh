#!/bin/bash

get_calendar()
{

    local today calendar pastdays

    today=$(date '+%e' | tr -d ' ')
    calendar=$(cal --monday \
        | sed -e "s/\b$today\b/<span background='lightgrey' foreground='black'>&<\/span>/" \
              -e '/^[[:space:]]*$/d')

    [ "$today" -ne 1 ] && {

        pastdays=$(seq -s '|' $((today -1)) )
        calendar=$(sed -E "s/\b($pastdays)\b/<span foreground='grey' strikethrough='true'>&<\/span>/g" <<< "$calendar")
    }

    echo "$calendar"
}


dunstify -r 1 '' "$(get_calendar)"
