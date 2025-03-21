#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL="ignoreboth:erasedups"
HISTFILESIZE=360

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '
[ "$VIFM" ] && PS1="fm $PS1"

alias ls='ls --group-directories-first -v --color=auto'
alias l='ls -1'
alias ll='ls -lh'
alias ..='cd ..'
alias cd-='cd $OLDPWD'
alias grep='grep --color=auto'
alias ip='ip -color'
alias da='du -sh'
alias man='man --locale=es_CL.UTF-8'
alias ff='vifm'
alias start='$HOME/.local/bin/wayland.sh'
alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu|grep -v "0.0  0.0"'

[ "$XDG_CURRENT_DESKTOP" ] && {
    source ~/.bashrc.d/fun.bashrc
    alias f='_fzf_ls'
    alias d='_fzf_home_directories'
}
# alias pacq='pacman -Qeq|fzf --bind="right:preview(pacman -Qi {})"'
# pacs () { pacman -Ssq "$1"|fzf --bind="right:preview(pacman -Si {})"; }
# tl() { trans :es -show-languages no "'$*'"; }
# alias tl='translatetospanish'
