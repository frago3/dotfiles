#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export BEMENU_OPTS='--ff "#d3d3d3" --nf "#d3d3d3" --af "#d3d3d3" --tf "#808080" --hf "#ffffff" --fb "#000000" --nb "#000000" --ab "#000000" --tb "#000000"--hb "#2a2a2a" --bdr "#000000" --fn "FreeSans bold 10" --ch 14 --cw 2 -M 580 -l 13 -B 6 -H 22 --fixed-height -ciswCT'
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --exact --no-info --preview-window=border-sharp --no-separator --marker="+" --bind=alt-left:preview-page-up,alt-right:preview-page-down,alt-up:preview-up,alt-down:preview-down --color=gutter:-1,marker:110:bold'
#
# [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && startx > /dev/null 2>&1
# alias startx='startx > /dev/null 2>&1'
