#!/bin/bash

coretemp() {
    echo CORETEMP
    command ls -v1 $(grep -l 'coretemp' /sys/class/hwmon/hwmon*/name | cut -d/ -f1-5)/temp*_{label,input} |
        xargs cat |
        awk 'NR % 2 {val=$0; next} {printf "%-15s +%.1f°C\n", $0, val/1000}'
}

dunstify -r 1 "" "$(coretemp)"
