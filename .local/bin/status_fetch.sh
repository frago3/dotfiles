#!/bin/bash

add() {
    buf="${buf}\n$(printf "%-13s%s" "$1" "$2")" 
}

add_kernel() {
    add 'Kernel' $(< /proc/sys/kernel/osrelease)
}

add_uptime() {
    add 'Uptime' "$(awk '{

        d=$1/60/60/24; h=$1/60/60%24; m=$1/60%60

        if(d >= 1)
            printf "%dd %dh %dm\n", d,h,m
        else
            printf "%dh %dm\n", h,m
    }' /proc/uptime)"
}

add_mem() {
    # MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable
    add $(awk '
        /^MemTotal/     {used+=$2}
        /^MemAvailable/ {used-=$2}
        END {
            printf "%s %.1fGi\n", "MemUsed", used/1048576
        }' /proc/meminfo)
}

add_battery() {
    local battery=/sys/class/power_supply/BAT1
    add $(< $battery/status) "$(< $battery/capacity)%"
}

add_coretemp() {
    local temp_dir=$(grep -l "coretemp" /sys/class/hwmon/hwmon*/name | cut -d/ -f1-5)

    add $(awk '{ t += $1 }
        END { printf "%s %.1f°C\n", "CoreTemp", t/NR/1000 }' $temp_dir/temp*_input)
}

buf=$(printf "%-13s%s" "OS" "GNU/Linux")
add_kernel
add_uptime
add_mem
# add_coretemp
add_battery

dunstify -r 1 '' "$buf"
