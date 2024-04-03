#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LESS='FRSXMK --mouse --tilde'
export SYSTEMD_LESS='FRSXMK --mouse --tilde'
PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '
HISTCONTROL=ignoreboth:erasedups

# vifm
source ~/.local/bin/fzf_dir.sh && alias f='fileselectorfzf'
alias ff='vifm'
[ -n "$VIFM" ] && PS1="fm $PS1"

alias ls='ls --group-directories-first -v --color=auto'
alias ll='ls -l'
alias lss='ls -1'
alias grep='grep --color=auto'
alias ip='ip -color'
alias da='du -sh'
alias man='man --locale=es_CL.UTF-8'
alias code='code 2> /dev/null'

# alias iv='setsid nsxiv -q'
# alias vim='TERM=xterm vim'
# alias vi='vim'

# alias pss='ps -eo pid,user,comm,pcpu,pmem | grep -v "0.0  0.0"'
# alias vim='TERM=xterm-256color vim'

translatetospanish() { trans :es -show-languages no "'$*'"; }
lite-xl_background() { [ "$#" -eq 0 ] && (lite-xl &) || (lite-xl "$*" &) }

alias tl='translatetospanish'
alias lite='lite-xl_background'

# go
export GOPATH=~/.go
