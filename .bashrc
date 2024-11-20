#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '

# $XDG_SESSION_TYPE
[ "$WAYLAND_DISPLAY" ] && source ~/.local/bin/fun.sh
[ "$VIFM" ] && PS1="fm $PS1"

alias ff='vifm'
alias ls='ls --group-directories-first -v --color=auto'
alias ll='ls -lh'
alias lss='ls -1'
alias ..='cd ..'
alias grep='grep --color=auto'
alias ip='ip -color'
alias da='du -sh'
alias man='man --locale=es_CL.UTF-8'
alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu|grep -v "0.0  0.0"'

# alias pacq='pacman -Qq|fzf --bind="right:preview(pacman -Qi {})"'
# tl() { trans :es -show-languages no "'$*'"; }
# alias tl='translatetospanish'
