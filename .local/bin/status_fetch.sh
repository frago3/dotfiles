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
    # add 'Uptime' "$(awk '{printf "%dh %.dm\n", $1/3600,$1%3600/60}' /proc/uptime)"
    add 'Uptime' "$(uptime -p | awk '{print $2"h "$4"m" }')"
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
    local battery=/sys/class/power_supply/BAT1
    add $(< $battery/status) "$(< $battery/capacity)%"
}

get_coretemp()
{
    local temp_dir=/sys/class/hwmon/hwmon4
    add $(awk -v name=$(< $temp_dir/name) '
        BEGIN { if(name != "coretemp") {print ":c"; exit} }
        { t += $1 }
        END{ printf "%s %.1f°C\n", "CoreTemp", t/NR/1000 }' $temp_dir/temp*_input)
}

get_volume()
{
    add 'Volume' $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100"%"}')
    add 'Brightness' $(brightnessctl -m | cut -d',' -f4)
}

get_kernel
get_uptime
get_mem
get_coretemp
get_battery
# get_volume

dunstify -r 1 '' "$buf"
