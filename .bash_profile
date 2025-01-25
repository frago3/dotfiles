#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export FZF_DEFAULT_OPTS="--layout=reverse --no-info --no-separator --no-scrollbar --preview-window=border-none,70% --color=gutter:-1,hl:15:bold,hl+:15"
alias sw='~/.local/bin/wayland.sh'

# [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && [ -z "$TMUX" ] && startx > /dev/null 2>&1
