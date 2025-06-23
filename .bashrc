#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL="ignoreboth:erasedups"

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '

[ -n "$VIFM" ] && PS1="fm $PS1"

alias ls='ls --group-directories-first -pv --color'
alias l='ls -1'
alias ll='ls -lh'
alias ..='cd ..'
alias cd-='cd $OLDPWD'
alias grep='grep --color=auto'
alias ip='ip -color'
alias da='du -sh'
alias man='man --locale=es_CL.UTF-8'
alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu|grep -v "0.0  0.0"'

if [ "$XDG_CURRENT_DESKTOP" ]
then
    source ~/.bashrc.d/fun.bashrc
    alias d='_fzf_home_directories'
    alias f='_fzf_ls'
    alias ff='_vifm_cd'
    bind -m emacs-standard -x '"\C-r": _fzf_history'
else
    alias start='$HOME/.local/bin/wayland.sh'
fi

# pacs () { pacman -Ssq "$1"|fzf --bind="right:preview(pacman -Si {})"; }
# tl() { trans :es -show-languages no "'$*'"; }
# alias tl='translatetospanish'
