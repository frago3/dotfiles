#!/bin/bash

swaymsg --type subscribe --monitor '[ "window" ]' |
while read -r event
do

    if jq -e '.change == "new" or .change == "close"' <<< "$event" > /dev/null; then

        case $(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true) | .representation' | wc -w) in
            1) swaymsg splith ;;
            *) swaymsg splitv ;;
        esac

    fi
done
