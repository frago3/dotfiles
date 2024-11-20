#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export HISTCONTROL=ignoreboth:erasedups
export FZF_DEFAULT_OPTS="--layout=reverse --no-info --no-separator --no-scrollbar --preview-window=border-none,70% --color=gutter:-1,hl:15:bold,hl+:15"
alias start='~/.local/bin/wayland.sh'
#
[ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && start
