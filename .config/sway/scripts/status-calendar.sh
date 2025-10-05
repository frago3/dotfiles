#!/bin/bash

calendar()
{

    local TODAY CALENDAR

    CALENDAR=$(cal -3 --columns 1 | sed "s/\b\([A-Z]\)[a-z]\b/<span foreground='gray'> \1<\/span>/g")
    # CALENDAR=$(cal -3 --monday --columns 1)
    TODAY=$(date '+%e'|tr -d ' ')
    
    # mes pasado
    sed 8q <<< "$CALENDAR" | sed -E "s/\b([0-9]|[0-9][0-9])\b/<span foreground='grey'>&<\/span>/g"

    # mes actual
    [ "$TODAY" -eq 1 ] && {
        sed -n '9,16p' <<< "$CALENDAR" | sed "s/\b1\b/<span background='white' foreground='black'>&<\/span>/"
    } || {
        sed -n '9,16p' <<< "$CALENDAR" | 
            sed -E -e "s/\b($(seq -s '|' $((TODAY - 1))))\b/<span foreground='grey'>&<\/span>/g" \
            -e "s/\b$TODAY\b/<span background='white' foreground='black'>&<\/span>/"
    }

    # mes próximo
    sed -n '16,24p' <<< "$CALENDAR"
}

dunstify -r 1 '' "$(calendar)"
