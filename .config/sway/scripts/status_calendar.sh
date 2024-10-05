#!/bin/bash

get_calendar()
{

    local today calendar

    # calendar=$(cal -3 --monday --columns 1)
    # calendar=$(cal -3 --monday --columns 1 | sed '2s/.*//;10s/.*//;18s/.*//')
    calendar=$(cal -3 --monday --columns 1 | sed "s/\b\([A-Z]\)[a-z]\b/<span foreground='gray'> \1<\/span>/g")
    today=$(date '+%e'|tr -d ' ')
    
    # mes pasado
    head -n8 <<< "$calendar" | sed -E "s/\b([0-9]|[0-9][0-9])\b/<span foreground='grey'>&<\/span>/g"
    # mes actual
    [ "$today" -eq 1 ] && {
        sed -n '9,16p' <<< "$calendar" | sed "s/\b1\b/<span background='white' foreground='black'>&<\/span>/"
    } || {
        sed -n '9,16p' <<< "$calendar" | 
            sed -E -e "s/\b($(seq -s '|' $((today - 1))))\b/<span foreground='grey'>&<\/span>/g" \
            -e "s/\b$today\b/<span background='white' foreground='black'>&<\/span>/"
    }
    # mes proximo
    tail -n8 <<< "$calendar"
}

# get_calendar
dunstify -r 1 '' "$(get_calendar)"
