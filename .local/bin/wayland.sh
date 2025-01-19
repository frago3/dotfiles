#!/bin/bash

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export BEMENU_OPTS="--fn 'system-ui Bold 10' -wicT -l14 --fixed-height -H23 -W0.56 -B3 --hf #ffffff --tf #deddda --af #c0bfbc --nf #c0bfbc --cf #000000 --hb #212121 --tb #000000 --ab #000000 --nb #000000 --fb #000000 --bdr #000000"
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORMTHEME=qt6ct
export ELECTRON_OZONE_PLATFORM_HINT=wayland

exec sway
# exec sway &> sway.log
