#!/bin/bash

CON=( $(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .focus[]') )

[ ${#CON[@]} -eq 0 ] && exit

setgeometry ()
{
    swaymsg "[con_id=$1]" resize set $2 $3, move absolute position $4 $5
}

case ${#CON[@]} in
    1)
        setgeometry  ${CON[0]}  1920  1060  0    0
        ;;
    2)
        setgeometry  ${CON[0]}  960   1060  960  0
        setgeometry  ${CON[1]}  960   1060  0    0
        ;;
    3)
        setgeometry  ${CON[0]}  960   1060  960  0
        setgeometry  ${CON[1]}  960   530   0    0
        setgeometry  ${CON[2]}  960   530   0    530
        ;;
    *)
        setgeometry  ${CON[0]}  960   1060  0    0
;;
esac

