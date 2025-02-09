#!/bin/bash

confirm() {

    [ "$(printf 'no\nyes'|dmenu -p "$1")" = 'yes' ]
}

case $(echo -e "suspend\npoweroff\nreboot\nexit" | dmenu -p power) in
    'suspend')
        sudo systemctl suspend
        ;;
    'poweroff')
        confirm 'poweroff' && sudo systemctl poweroff
        ;;
    'reboot')
        confirm 'reboot' && sudo systemctl reboot
        ;;
    'exit')
        confirm 'exit' && dunstify exit
        ;;
    *)
        exit ;;
esac
