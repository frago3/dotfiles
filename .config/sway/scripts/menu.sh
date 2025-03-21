#!/bin/bash

command ls $HOME/.config/sway/scripts/menu-* |
    awk -F- '{print $2}' |
    bemenu -p menu |
    xargs -r -I{} sh "menu-{}"

