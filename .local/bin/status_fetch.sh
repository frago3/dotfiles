#!/bin/bash

buf=$(printf "%-13s%s" "OS" "GNU/Linux")

add()
{
    buf="${buf}\n$(printf "%-13s%s" "$1" "$2")" 
    # [ -n "$buf" ] &&
}

get_kernel()
{
    add 'Kernel' $(cat /proc/sys/kernel/osrelease)
}

get_uptime()
{
    local uptime=$(awk '
        { h = $1/3600; m = $1%3600/60}
        END { printf "%.fh %.fm\n",h,m }' /proc/uptime)

    add 'Uptime' "$uptime"
}

get_mem()
{
    local mem=$(free -hL)
    add 'MemUsed' ${mem:49:10}
    # add 'MemCache' ${mem:29:10}
    # add 'MemFree' ${mem:69:10}
}

get_battery()
{
    local status=$(cat /sys/class/power_supply/BAT1/status)
    local capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    add $status "${capacity}%"
}

get_cpu()
{
    local cputotal=$(ps -eo pcpu --no-headers \
        | awk '$1 != "0.0" { total += $1 } END { print total"%" }')

    local temp=$(awk '{ print $1/1000"°C" }' /sys/class/thermal/thermal_zone7/temp)
    
    add 'Cpu' $cputotal
    add 'CpuTemp' $temp
}

get_kernel
get_uptime
# get_cpu
get_mem
get_battery

dunstify --replace=1 '' "<tt>$buf</tt>"
