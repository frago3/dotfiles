#!/bin/bash

DEVICE=wlan0
STATUS=''
SSID=''

confirm() {

    [ "$(printf 'no\nyes'|bemenu -p "$1")" = 'yes' ]
}

toggle_wifi() {

    if [[ "$STATUS" =~ 'wifi on' ]]; then
        confirm 'disable wifi' && rfkill block wlan && dunstify -u low 'Wifi disabled' && exit
    else
        confirm 'enablable wifi' && rfkill unblock wlan && dunstify -u low 'Wifi enablabled' && exit
    fi
}

disconnect_from_network() {

    [ "$SSID" ] && confirm "disconnect from $SSID" && {
        iwctl station $DEVICE disconnect && dunstify -u low 'Wifi disconnected' && exit
    }
}

format() {
    # #SSID name
    # psk|open|8021x
    sed -e 's/[[:cntrl:]]\[[0-9;]*m//g' \
        -e '1,4d' \
        -e 's/^ *>* *\(\S.*\S\) *\(psk\|open\|8021x\).*$/#\1\n\2/g'
}

choose() {
    # grep "^#" <<< "$2"| cut -c 2- | bemenu -p "$1"
    sed -n 's/^#//p' <<< "$2"| bemenu -p "$1"
}

forget() {

    local chosen
    chosen=$(choose 'forget network' "$(iwctl known-networks list|format)") || return

    confirm "forget $chosen" && {
        iwctl known-networks "$chosen" forget && dunstify -u low "$chosen forgotten"
    }
}

connect_to_network(){

    local available_networks chosen

    available_networks=$(iwctl station $DEVICE get-networks|format)
    chosen=$(choose 'available networks' "$available_networks") || return 

    # is already on that network
    [ "$chosen" = "$SSID" ] && dunstify -u low 'Wifi connected' && exit

    local security
    security=$(grep -A1 "$chosen" <<< "$available_networks" | tail -n 1)

    # network is open or known
    if iwctl known-networks list|grep -q "$chosen" || [ "$security" = 'open' ]
    then

      iwctl station $DEVICE connect "$chosen" && dunstify -u low 'Wifi connected' && exit

    elif [ "$security" = psk ] || [ "$security" = "8021x" ]
    then

      local passd
      passd=$(bemenu -p 'password' <<< '') || return

      iwctl --passphrase "$passd" station $DEVICE connect "$chosen" &&
          dunstify -u low 'Wifi connected' ||
          dunstify -u low 'Operation failed' && exit
    fi
}

while true
do

  [ $(rfkill|awk '/wlan /{print $4}') == 'unblocked' ] && {

    # SSID=$(iwctl station "$DEVICE" show|grep 'Connected network'|cut -c35-|sed 's/ *$//')
    SSID=$(iwctl station "$DEVICE" show|awk '/Connected network/{ gsub(/.*network *| *$/,""); print}')

    [ "$SSID" ] && 
       STATUS="wifi on: $SSID" ||
       STATUS="wifi on"  
  } || STATUS="wifi off"

  case $(printf "connect\ndisconnect\nforget\ntoggle"|bemenu -p "$STATUS") in

      'toggle')         toggle_wifi ;;
      'connect')        connect_to_network ;;
      'disconnect')     disconnect_from_network ;;
      'forget')         forget ;;
      *)                break ;;

  esac

done
