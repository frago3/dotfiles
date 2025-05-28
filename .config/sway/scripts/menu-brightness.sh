#!/bin/bash

percent=$(brightnessctl -m)

while true
do
    
    index=$(echo -e "increase\ndecrease\nminimum\nrestore" |
        fuzzel -dp "brightness $(cut -d',' -f4 <<< $percent) " --select-index=${index:-0} --index)

    case $index in

        0) percent=$(brightnessctl -m set +1%)  ;;
        1) percent=$(brightnessctl -mn set 1%-) ;;
        2) percent=$(brightnessctl -m set 1)    ;;
        3) percent=$(brightnessctl -m set 6%)   ;;
        *) exit ;;
    esac

done
