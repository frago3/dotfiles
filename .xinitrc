#!/bin/sh

xrdb -merge $HOME/.config/X11/Xresources
xmodmap $HOME/.config/X11/Xmodmap
# start some nice programs
xinitdir=/etc/X11/xinit

if [ -d $xinitdir/xinitrc.d ] ; then
 for f in "$xinitdir/xinitrc.d"/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
export QT_QPA_PLATFORMTHEME=qt5ct
export FZF_DEFAULT_OPTS="-e --reverse --no-info --no-separator --no-scrollbar --preview-window=border-none,70% --color=gutter:-1,hl:15:bold,hl+:15"
export PATH="$PATH:$HOME/.config/cwm/scripts"

sh ~/.fehbg &
(sleep 1; polybar -c ~/.config/cwm/polybar.ini ) &

exec cwm -c ~/.config/cwm/cwmrc
