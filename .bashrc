#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '

source ~/.local/bin/fnrc

[ -n "$VIFM" ] && PS1="fm $PS1"
alias ff='vifm'
alias ls='ls --group-directories-first -v --color=auto'
alias ll='ls -l'
alias lss='ls -1'
alias cd..='cd ..'
alias grep='grep --color=auto'
alias ip='ip -color'
alias da='du -sh'
alias man='man --locale=es_CL.UTF-8'
alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu|grep -v "0.0  0.0"'
alias py='python'
alias yt='yt-dlp -f "wv*+wa/w"'
alias yta='yt-dlp -f "wv*+wa/w" --extract-audio'

alias pacq='pacman -Qq|fzf --bind="right:preview(pacman -Qi {})"'
# translatetospanish() { trans :es -show-languages no "'$*'"; }
# alias tl='translatetospanish'
