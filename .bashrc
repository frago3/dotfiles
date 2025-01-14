#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL="ignoreboth:erasedups"

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '

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
alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu|grep -v "0.0  0.0"'

[ "$WAYLAND_DISPLAY" ] && {
    source ~/.bashrc.d/fun.bashrc
    alias f='_fzf_ls'
    alias d='_fzf_home_directories'
    alias color='_color_picker'
}
[ "$VIFM" ] && PS1="fm $PS1"
alias pacq='pacman -Qeq|fzf --bind="right:preview(pacman -Qi {})"'
# tl() { trans :es -show-languages no "'$*'"; }
# alias tl='translatetospanish'
