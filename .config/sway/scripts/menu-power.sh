#!/bin/bash

confirm() {

    [ "$(printf 'no\nyes'|bemenu -p "$1")" = 'yes' ]
}

case $(echo -e "suspend\npoweroff\nreboot\nexit" | bemenu -p power) in
    'suspend')
        systemctl suspend
        ;;
    'poweroff')
        confirm 'poweroff' && systemctl poweroff
        ;;
    'reboot')
        confirm 'reboot' && systemctl reboot
        ;;
    'exit')
        confirm 'exit' && swaymsg exit
        ;;
    *)
        exit ;;
esac
