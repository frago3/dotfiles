#!/bin/bash

bright=~/.config/hypr/scripts/mkeys_light.sh

opts='increase
decrease
minimum
restore'

while true
do
    chosen=$(echo "$opts" | bemenu -p 'brightness' -I ${index:-0})

    case $chosen in
        'increase') $bright -up ;;

        'decrease') $bright -down ;;

        'minimum') $bright -min ;;

        'restore') $bright -restore ;;

        *) exit ;;
    esac

    index=$(awk "/$chosen/{print NR-1}" <<< "$opts")
done
