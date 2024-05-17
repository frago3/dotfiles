#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export HISTCONTROL=ignoreboth:erasedups
export FZF_DEFAULT_OPTS='--reverse --no-info --no-separator --no-scrollbar --preview-window=border-none,70% --color=gutter:-1,prompt:4,pointer:1,hl:15:bold,hl+:15' 
# export BEMENU_OPTS="--fn 'System-ui Bold 10' -l13 -B1 -H22 -wbiCT --tf #deddda --af #c0bfbc --nf #c0bfbc --hf #ffffff --hb #191919 --tb #000000 --nb #000000 --ab #000000 --fb #000000 --cf #000000 --bdr #595959"

alias start='~/.local/bin/sway_run.sh'
#
# [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && start
