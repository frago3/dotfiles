#!/bin/bash

confirm()
{
    [ "$(printf 'No\nYes' | rofi -dmenu -p "$1. Are you sure?  " -i)" = 'Yes' ]
}

case $(printf "Suspend\nShutdown\nReboot\nExit" | rofi -dmenu -p 'Power  ' -i ) in
    'Reboot')
        confirm 'Reboot' && sudo systemctl reboot ;;

    'Shutdown')
        confirm 'Shutdown' && sudo systemctl poweroff ;;

    'Suspend')
        sudo systemctl suspend ;;

    'Exit')
        confirm 'Exit' && bspc quit ;;

    *)
        exit 1 ;;
esac
