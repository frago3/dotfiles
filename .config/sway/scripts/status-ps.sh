#!/bin/bash

dunstify -r 1 '' "$(ps -eo comm:20,pcpu,pmem --sort=-%cpu | grep -v '0.0  0.0')"
