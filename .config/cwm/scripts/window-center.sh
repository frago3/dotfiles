#!/bin/bash

# Width: 1920
# Height: 1080

eval $(xdotool getactivewindow getwindowgeometry --shell | sed -n '1p;4p;5p')

xdotool windowmove \
    $WINDOW \
    $(( (1920 - $WIDTH) / 2 )) \
    $(( (1062 - $HEIGHT) / 2 ))
