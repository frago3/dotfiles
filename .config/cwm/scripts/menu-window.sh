#!/bin/bash

wmctrl -l | awk '{print $2, "  ", substr($0, 21), "  ",$1}' |
    sort |
    dmenu -p window |
    grep -oE '[^ ]+$' | xargs wmctrl -ia
