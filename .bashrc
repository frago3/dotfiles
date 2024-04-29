#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '
HISTCONTROL=ignoreboth:erasedups

source ~/.local/bin/fzf_file.sh
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

alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu | grep -v "0.0  0.0"'
translatetospanish() { trans :es -show-languages no "'$*'"; }

alias tl='translatetospanish'

