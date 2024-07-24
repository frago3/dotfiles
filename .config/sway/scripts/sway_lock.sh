#!/bin/bash

fg=000000
bg=574C91

swaylock --ignore-empty-password --indicator-thickness 0 \
    --font 'freesans' --font-size 19 \
    --text-color $fg \
    --text-clear-color $fg \
    --text-caps-lock-color $fg \
    --text-ver-color $bg \
    --text-wrong-color $fg \
    --text-caps-lock-color $fg \
    --color $bg \
    --inside-color $bg \
    --inside-clear-color $bg \
    --inside-caps-lock-color $bg \
    --inside-ver-color $bg \
    --inside-wrong-color $bg \
    --line-color $bg \
    --line-clear-color $bg \
    --line-caps-lock-color $bg \
    --line-ver-color $bg \
    --line-wrong-color $bg
