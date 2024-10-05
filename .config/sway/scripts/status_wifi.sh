#!/bin/bash

dunsty() {
  dunstify -r 1 "$1" "$2"
}

if [ $(rfkill |awk '/wlan/{print$4}') == 'blocked' ]
then

  dunsty 'Wifi: disabled'

else

  wifistatus=$(iwctl station wlan0 show)
  grep -q 'disconnected' <<< "$wifistatus" && 

        dunsty 'Wifi: disconnected' ||
        dunsty '' "$(sed -e '1,6d' -e 's/^ *//' -e 's/ *$//' <<< "$wifistatus")"
fi
