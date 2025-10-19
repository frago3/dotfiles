#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
export HISTIGNORE='ls:ll:l:v:v *:d:f:z:z *:z-:..'
export EDITOR="nvim"

PS1='[\[\e[1;34m\]\W\[\e[m\]]\\$ '

[ -n "$VIFM" ] && PS1="fm $PS1"

alias ls='ls --color=auto --group-directories-first -pv'
alias l='ls -1'
alias ll='ls -lh'
alias ..='cd ..'
alias z-='cd $OLDPWD'
alias z='cd'
alias grep='grep --color=auto'
alias ip='ip -color'
alias fd='fd -c never'
alias man='man --locale=es_CL.UTF-8'
alias v='nvim'
alias f='vifm'
alias tree='tree --noreport'
# alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu|grep -v "0.0  0.0"'

[ ! "$XDG_CURRENT_DESKTOP" ] && return

_fzf_history ()
{
    READLINE_LINE=$(history | cut -c8- | awk '!x[$0]++' | fzf --tac) || return
    READLINE_POINT=${#READLINE_LINE}
}
bind -m emacs-standard -x '"\C-r": _fzf_history'

d ()
{
    local DIR; DIR=$(fd --base-directory ~ -H -td -d5 \
        -EMusic/samples/* \
        -ESuperCollider \
        -EBraveSoftware \
        -E.cache \
        -E.git |
        fzf --tac --scheme=path) || return
    cd "$HOME/$DIR"
}

color ()
{
    local POINT; POINT="$(slurp -p)" || return
    grim -g "$POINT" -t ppm - | magick - -format '#%[hex:p{0,0}]\n' info:
}

