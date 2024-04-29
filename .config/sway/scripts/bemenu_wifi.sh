#!/bin/bash
#
# necesita wireless_tools
device=wlan0
connected_network="$(iwgetid -r)"

_format() {
    ##SSID name
    #(psk|open|8021x)

    sed -e 's/[[:cntrl:]]\[[0-9;]*m//g' -e '1,4d' \
        -e 's/^ *\(\S.*\S\) *\(psk\|open\|8021x\).*$/#\1\n\2/g'
}

_choose_name() {
    grep "^#" <<< "$1"| cut -c 2- | bemenu -p "$2"
}

connect() {
    local available_networks=$(iwctl station $device get-networks | _format)
    local chosen=$(_choose_name "$available_networks" 'Available networks')
    [ -z "$chosen" ] && return

    # network starts with '> ' user is already on that network
    [ "$chosen" = ">   $connected_network" ] && {
        dunstify 'Connected'; return
    }

    local security=$(grep -A 1 "$chosen" <<< "$available_networks" | tail -n 1)

    # network is open or known
    if iwctl known-networks list | grep -q "$chosen" || [ "$security" = 'open' ]
    then

        echo iwctl station $device connect "$chosen" && dunstify 'Connected'

    elif [ "$security" = psk ] || [ "$security" = "8021x" ]
    then

        local passd=$(bemenu -p 'password' -x indicator<<< "")
        [ -n "$passd" ] && iwctl --passphrase "$passd" station $device connect "$chosen" && dunstify 'Connected' || dunstify 'Operation failed'
    fi
}

_confirm() {
    [ "$(printf 'No\nYes' | bemenu -p "$1")" = 'Yes' ]
}

disconnect() {
    [ "$connected_network" ] && _confirm "disconnect from $connected_network" && {

        iwctl station $device disconnect && dunstify 'Disconnected'
    }
}

forget() {
    local known_networks=$(iwctl known-networks list | _format)
    local chosen=$(_choose_name "$known_networks" 'forget network')

    [ "$chosen" ] && _confirm "forget $chosen" && {
        iwctl known-networks "$chosen" forget && dunstify 'Forgotten'
    }
}

case $(printf "connect\ndisconnect\nforget" | bemenu -p 'wifi') in
    'connect') connect ;;
    'disconnect') disconnect ;;
    'forget') forget ;;
    *) exit 0 ;;
esac
