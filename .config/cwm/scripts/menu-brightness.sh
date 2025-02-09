#!/bin/bash

value=$(brightnessctl -m)

while true
do

    case $(echo -e "increase\ndecrease\nminimum\nrestore" |
        dmenu -p "brightness $(cut -d',' -f4 <<< "$value")" -n ${index:-0}) in

        'increase') 
            index=0
            value=$(brightnessctl -m set +1%) ;;

        'decrease') 
            index=1
            value=$(brightnessctl -mn set 1%-) ;;

        'minimum')
            index=2
            value=$(brightnessctl -m set 1) ;;

        'restore')
            index=3
            value=$(brightnessctl -m set 6%) ;;

        *) exit ;;
    esac

done
