#!/bin/bash

get_calendar()
{

    local today=$(date '+%e' | tr -d ' ')

    local calendar=$(cal --monday \
        | sed -e "s/\b$today\b/<span background='lightgrey' foreground='black'>&<\/span>/" \
              -e '/^[[:space:]]*$/d')

    [ "$today" -ne 1 ] && {

        local pastdays=$(seq -s '|' $((today -1)) )

        local calendar=$(sed -E "s/\b($pastdays)\b/<span foreground='grey' strikethrough='true'>&<\/span>/g" <<< "$calendar")
    }

    echo "$calendar"
}


dunstify -r 1 '' "$(get_calendar)"
