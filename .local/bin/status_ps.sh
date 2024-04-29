#!/bin/bash

ps_cpu()
{
     echo 'COMMAND              %CPU %MEM'
     ps -eo comm:20,pcpu,pmem --no-header --sort=-%cpu | grep -v '0.0  0.0'
}

dunstify --replace=2 '' "<tt>$(ps_cpu)</tt>"
