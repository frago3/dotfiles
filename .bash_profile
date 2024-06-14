#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export HISTCONTROL=ignoreboth:erasedups
export FZF_DEFAULT_OPTS="--layout=reverse --no-info --no-separator --no-scrollbar --preview-window=border-none,70% --color=gutter:-1,prompt:4,pointer:1,hl:15:bold,hl+:15"

alias start='~/.local/bin/sway_run.sh'
#
# [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && start
