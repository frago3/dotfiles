#!/bin/bash


format() {
    # #SSID name
    # psk|open|8021x
    # sed -e 's/[[:cntrl:]]\[[0-9;]*m//g' \
    #     -e '1,4d' \
    #     -e 's/^ *>* *\(\S.*\S\) *\(psk\|open\|8021x\).*$/#\1\n\2/g'
    sed -e 's/[[:cntrl:]]\[[0-9;]*m//g' \
        -e '1,4d' \
        -e 's/^ *>* *\(\S.*\S\) *\(psk\|open\|8021x\).*$/#\1\n\2/g'
}

choose() {
    # grep "^#" <<< "$2"| cut -c 2- | bemenu -p "$1"
    sed -n 's/^#//p' <<< "$2"| fuzzel -dp "$1 "
}

w="
  WIFI_17                           psk                     May 11,  2:10 PM
  elisa5GHZ_D600D5                  psk                     May 11,  2:01 PM
"
echo "$w" | sed 's/^ *>* *\(\S.*\S\) *\(psk\|open\|8021x\).*$/#\1\n\2/g' 
# iwctl known-networks list
# iwctl known-networks list
# iwctl station wlan0 get-networks|format
# iwctl station wlan0 disconnect

# connect_to_network(){

#     local available_networks chosen

#     available_networks=$(iwctl station $DEVICE get-networks|format)
#     chosen=$(choose 'available networks' "$available_networks") || return

#     # is already on that network
#     [ "$chosen" = "$SSID" ] && dunstify -u low 'Wifi connected' && exit

#     local security
#     security=$(grep -A1 "$chosen" <<< "$available_networks" | tail -n 1)

#     # network is open or known
#     if iwctl known-networks list|grep -q "$chosen" || [ "$security" = 'open' ]
#     then

#         iwctl station $DEVICE connect "$chosen" && dunstify -u low 'Wifi connected' && return

#     elif [ "$security" = psk ] || [ "$security" = "8021x" ]
#         then

#             local passd
#             passd=$(fuzzel -dp 'password ' <<< '') || return

#             iwctl --passphrase "$passd" station $DEVICE connect "$chosen" &&
#                 dunstify -u low 'Wifi connected' ||
#                 dunstify -u low 'Operation failed' && return
#         fi
# }
