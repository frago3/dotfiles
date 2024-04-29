#!/bin/bash

get_wifistatus()
{

    local wifistatus=$(iwctl station wlan0 show)

    if grep -q 'disconnected' <<< "$wifistatus"; then
        echo 'Status disconnect'

    else
        echo "$wifistatus" | sed -e 's/^ *//' -e 's/ *$//' | tail -n +6

    fi
}

dunstify --replace=3 '' "<tt>$(get_wifistatus)</tt>"
