#!/bin/bash

value=$(brightnessctl -m)

while true
do

    case $(echo -e "increase\ndecrease\nminimum\nrestore" |
        fuzzel -dp "brightness $(cut -d',' -f4 <<< "$value") " --select=${index:-0}) in

        'increase') 
            index=increase
            value=$(brightnessctl -m set +1%) ;;

        'decrease') 
            index=decrease
            value=$(brightnessctl -mn set 1%-) ;;

        'minimum')
            index=minimum
            value=$(brightnessctl -m set 1) ;;

        'restore')
            index=restore
            value=$(brightnessctl -m set 6%) ;;

        *) exit ;;
    esac

done
