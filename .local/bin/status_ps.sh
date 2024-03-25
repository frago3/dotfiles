#!/bin/bash

ps_cpu()
{

    local header='COMMAND         %CPU %MEM\n'

    local pscpu=$(ps -eo comm,pcpu,pmem --no-header \
        | awk '
        BEGIN { FIELDWIDTHS = "15 5 5" }
        $0 !~ "0.0  0.0" {
            col2[$1] += $2
            col3[$1] += $3
        }
        END {
            for (comm in col2)
            printf "%15s|%5.1f|%5.1f\n", comm, col2[comm], col3[comm] }' \
        | sort -t'|' -k2,2nr | sed 's/|//g' )

    echo "$header$pscpu"
}

dunstify --replace=2 '' "<tt>$(ps_cpu)</tt>"