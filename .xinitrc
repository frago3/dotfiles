#!/bin/sh

xrdb -merge $HOME/.config/X11/Xresources
xmodmap $HOME/.config/X11/Xmodmap
xinitdir=/etc/X11/xinit
# start some nice programs

if [ -d $xinitdir/xinitrc.d ] ; then
 for f in "$xinitdir/xinitrc.d"/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export QT_QPA_PLATFORMTHEME=qt5ct

sh ~/.fehbg &
exec i3
