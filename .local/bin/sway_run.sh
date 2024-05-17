#!/bin/bash

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export BEMENU_OPTS="--fn 'System-ui Bold 10' -l13 -B1 -H22 -wbiCT --tf #deddda --af #c0bfbc --nf #c0bfbc --hf #ffffff --hb #191919 --tb #000000 --nb #000000 --ab #000000 --fb #000000 --cf #000000 --bdr #000000"

# exec sway "$@"
exec sway "$@" > /dev/null 2>&1
# exec sway "$@" > ~/sway.log 2>&1
# exec systemd-cat --identifier=sway sway "$@"
