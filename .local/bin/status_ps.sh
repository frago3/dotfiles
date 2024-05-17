#!/bin/bash

ps_cpu()
{
     ps -eo comm:20,pcpu,pmem --sort=-%cpu | grep -v '0.0  0.0'
}

dunstify -r 1 '' "$(ps_cpu)"
