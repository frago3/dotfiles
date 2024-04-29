#!/bin/bash

buf=$(printf "%-13s%s" "OS" "GNU/Linux")

add()
{
    buf="${buf}\n$(printf "%-13s%s" "$1" "$2")" 
}

get_kernel()
{
    add 'Kernel' $(< /proc/sys/kernel/osrelease)
}

get_uptime()
{
    add 'Uptime' "$(awk '{printf "%dh %.dm\n", $1/3600,$1%3600/60}' /proc/uptime)"
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
    add $(< /sys/class/power_supply/BAT1/status) \
       "$(< /sys/class/power_supply/BAT1/capacity)%"
}

get_coretemp()
{
    local temp_dir=/sys/class/hwmon/hwmon4
    add $(awk -v name=$(< $temp_dir/name) '
    BEGIN { if(name != "coretemp") {print ":c"; exit}}
    { t += $1 }
    END{ printf "%s %.1f°C\n", "CoreTemp", t/NR/1000 }' $temp_dir/temp*_input)
}

get_kernel
get_uptime
get_mem
get_coretemp
get_battery

dunstify --replace=1 '' "<tt>$buf</tt>"
# dunstify --replace=1 '' "<span font='monospace'>$buf</span>"
