#!/bin/bash

confirm() {
    [ "$(printf 'no\nyes' | bemenu -p "$1. are you sure?")" = 'yes' ]
}

case $(printf "suspend\nshutdown\nreboot\nexit" | bemenu -p 'power') in
    'reboot')
        confirm 'reboot' && sudo systemctl reboot ;;

    'shutdown')
        confirm 'shutdown' && sudo systemctl poweroff ;;

    'suspend')
        sudo systemctl suspend ;;

    'exit')
        confirm 'exit' && swaymsg exit ;;

    *)
        exit ;;
esac
