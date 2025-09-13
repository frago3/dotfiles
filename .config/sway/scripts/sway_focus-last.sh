#!/bin/bash

LAST=$(swaymsg -t get_workspaces|jq '.[]|select(.focused==true)|.focus[1]')
[ "$LAST" != 'null' ] && swaymsg "[con_id=$LAST]" focus
