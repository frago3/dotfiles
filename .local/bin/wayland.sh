#!/bin/bash

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export FZF_DEFAULT_OPTS="--no-info --no-separator --no-scrollbar --preview-window=border-none --color=prompt:4,gutter:-1,pointer:236,hl:-1,hl+:-1"
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export PATH=$PATH:$HOME/.config/sway/scripts

exec sway
# exec sway &> /dev/null
