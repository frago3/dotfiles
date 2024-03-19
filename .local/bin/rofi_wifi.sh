#!/bin/bash
#
# necesita wireless_tools
device=wlan0
connected_network="$(iwgetid -r)"

_format()
{
    ##SSID name
    #(psk|open|8021x)

    echo "$(eval $1 \
        | sed -e 's/[[:cntrl:]]\[[0-9;]*m//g' -e '1,4d' \
            -e 's/^ *\(\S.*\S\) *\(psk\|open\|8021x\).*$/#\1\n\2/g')"
}

_choose_name()
{
    echo "$( echo "$1" | grep '#[[:print:]]' | cut -c 2- \
        | rofi -dmenu -p "$2  " -i -theme-str 'listview { columns: 1; }')"
}

connect()
{
    local available_networks=$(_format "iwctl station $device get-networks")
    local chosen=$(_choose_name "$available_networks" 'Available networks')
    [ -z "$chosen" ] && return

    # network starts with '> ' user is already on that network
    [ "$chosen" = ">   $connected_network" ] && {
        dunstify 'Connected'
        return
    }

    local security=$(echo "$available_networks" | grep -A 1 "$chosen" | tail -n 1)

    # network is open or known
    if iwctl known-networks list | grep -q "$chosen" || [ "$security" = 'open' ]
    then

        iwctl station $device connect "$chosen" && dunstify 'Connected'

    elif [ "$security" = psk ] || [ "$security" = "8021x" ]
    then

        # local passd=$(rofi -dmenu -password -p 'Password  ')
        local passd=$(rofi -dmenu -p 'Password  ')
        [ -n "$passd" ] && {
            iwctl --passphrase "$passd" station $device connect "$chosen" && dunstify 'Connected' || dunstify 'Operation failed'
        }
    fi
}

_confirm ()
{
    [ "$(printf 'No\nYes' | rofi -dmenu -p "$1  " -i)" = 'Yes' ]
}

disconnect()
{
    [ "$connected_network" ] && _confirm "Disconnect from $connected_network" && {

        iwctl station $device disconnect && dunstify 'Disconnected'
    } || dunstify 'Disconnected'
}

forget()
{
    local known_networks=$(_format 'iwctl known-networks list')
    local chosen=$(_choose_name "$known_networks" 'Forget network')
    
    [ "$chosen" ] && _confirm "Forget $chosen" && {
        iwctl known-networks "$chosen" forget && dunstify 'Forgotten'
    }
}

case $(printf "Connect\nDisconnect\nForget" | rofi -dmenu -p 'Wifi  ' -i ) in
    'Connect') connect ;;
    'Disconnect') disconnect ;;
    'Forget') forget ;;
    *) exit 1 ;;
esac
