#!/bin/bash

confirm() {

    [ "$(printf 'no\nyes'|fuzzel -dp "$1 ")" = 'yes' ]
}

case $(echo -e "suspend\npoweroff\nreboot\nexit" | fuzzel -dp 'power ') in
    'suspend')
        hyprlock -q & sleep 1 ; systemctl suspend ;;
    'poweroff')
        confirm 'poweroff' && systemctl poweroff ;;
    'reboot')
        confirm 'reboot' && systemctl reboot ;;
    'exit')
        confirm 'exit' && swaymsg exit ;;
    *)
        exit ;;
esac
