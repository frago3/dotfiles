#!/bin/bash

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export FZF_DEFAULT_OPTS="--no-info --no-separator --no-scrollbar --reverse --exact --color=prompt:4,gutter:-1,pointer:236,hl:-1:underline,hl+:-1 --preview-window=border-none,70%"
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export PATH=$PATH:$HOME/.config/sway/scripts

exec sway
# exec sway &> /dev/null
