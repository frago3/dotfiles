#!/bin/bash

add() {
    BUF="${BUF}\n$(printf "%-13s%s" "$1" "$2")" 
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
    local BATTERY; BATTERY=/sys/class/power_supply/BAT1
    add $(< $BATTERY/status) "$(< $BATTERY/capacity)%"
}

BUF=$(printf "%-13s%s" "OS" "GNU/Linux")
add_kernel
add_uptime
add_mem
add_battery

dunstify -r 1 '' "$BUF"
