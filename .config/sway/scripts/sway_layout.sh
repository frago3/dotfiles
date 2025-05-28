#!/bin/bash

con=( $(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .focus[]') )

[ ${#con[@]} -eq 0 ] && exit

setgeometry(){
    swaymsg "[con_id=$1]" resize set $2 $3, move absolute position $4 $5
}

case ${#con[@]} in
    1)
        setgeometry ${con[0]} 1920 1060 0 0
        ;;
    2)
        setgeometry ${con[0]} 960 1060 0 0
        setgeometry ${con[1]} 960 1060 960 0
        ;;
    3)
        setgeometry ${con[0]} 960 1060 0 0
        setgeometry ${con[1]} 960 530 960 0
        setgeometry ${con[2]} 960 530 960 530
        ;;
    *)
        setgeometry ${con[0]} 960 1060 0 0
        ;;
esac

