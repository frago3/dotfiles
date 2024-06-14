#!/bin/bash

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export BEMENU_OPTS="--fn 'system-ui Bold 10' -l13 -B1 -H22 -wibC --hf #ffffff --tf #deddda --af #c0bfbc --nf #c0bfbc --cf #000000 --hb #212121 --tb #000000 --ab #000000 --nb #000000 --fb #000000 --bdr #000000"
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORMTHEME=qt6ct
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# exec sway "$@"
exec sway "$@" > /dev/null 2>&1
# exec sway "$@" > ~/sway.log 2>&1
# exec systemd-cat --identifier=sway sway "$@"
