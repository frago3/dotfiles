#!/bin/bash

killall -q fuzzel && exit
# command ls /usr/bin/ | fuzzel -dp 'drun ' | xargs -r setsid 
fuzzel
