#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '
HISTCONTROL=ignoreboth:erasedups

export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --exact --no-info --preview-window=border-sharp --no-separator --marker="+" --bind=alt-left:preview-page-up,alt-right:preview-page-down,alt-up:preview-up,alt-down:preview-down --color=gutter:-1,marker:110:bold'

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
alias iv='setsid nsxiv -q'
alias em='emacs -nw'

# alias pss='ps -eo pid,user,comm,pcpu,pmem | grep -v "0.0  0.0"'
# alias vim='TERM=xterm-256color vim'

translatetospanish() { trans :es -show-languages no "'$*'"; }
lite-xl_background() { [ "$#" -eq 0 ] && (lite-xl &) || (lite-xl "$*" &) }

alias tl='translatetospanish'
alias lite='lite-xl_background'

# go
export GOPATH=~/.go
