#!/bin/bash

command ls $HOME/.config/sway/scripts/menu-* |
    awk -F- '{print $2}' |
    fuzzel -dp 'menu ' |
    xargs -r -I{} sh "menu-{}"

