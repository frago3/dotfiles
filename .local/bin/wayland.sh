#!/bin/bash

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export BEMENU_OPTS="--fn 'Roboto Condensed Medium 11' -wicCT -l22 -H23 -W0.40 -B3 --hf #ffffff --tf #deddda --af #deddda --nf #deddda --cf #000000 --hb #212121 --tb #000000 --ab #000000 --nb #000000 --fb #000000 --bdr #000000"
export FZF_DEFAULT_OPTS="-e --reverse --no-info --no-separator --no-scrollbar --preview-window=border-none,70% --color=gutter:-1,hl:15:bold,hl+:15"
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORMTHEME=qt6ct
# export ELECTRON_OZONE_PLATFORM_HINT=wayland
export PATH=$PATH:$HOME/.config/sway/scripts

exec sway
# exec sway &> sway.log
