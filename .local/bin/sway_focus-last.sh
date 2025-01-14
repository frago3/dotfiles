#!/bin/bash

last=$(swaymsg -t get_workspaces|jq '.[]|select(.focused==true)|.focus[1]')
[ "$last" != 'null' ] && swaymsg "[con_id=$last]" focus
