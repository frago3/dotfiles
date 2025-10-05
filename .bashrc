#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL="ignoreboth:erasedups"
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
alias ff='cd "$(vifm --choose-dir -)"'
alias v='nvim'
alias tree='tree --noreport'
# alias pss='ps -eo pid,user,comm,pcpu,pmem --sort=-pcpu|grep -v "0.0  0.0"'

[ ! "$XDG_CURRENT_DESKTOP" ] && return

_fzf_history()
{
    READLINE_LINE=$(history | cut -c8- | awk '!x[$0]++' | fzf --tac) || return
    READLINE_POINT=${#READLINE_LINE}
}

_fzf_home_directories ()
{
    local DIR; 
    DIR=$(fd --base-directory ~/ -H -td -d5 \
        -EMusic/samples/* \
        -E.config/SuperCollider/* \
        -E.config/BraveSoftware/* \
        -E.local/* \
        -E.cache \
        -E.git |
        fzf --tac --scheme=path --preview-window=68% \
            --bind='right:preview: ls -pAv --group-directories-first --color $HOME/{}') || return
    cd "$HOME/$DIR"
}

# _get_color ()
# {
#     local P; P="$(slurp -p)" || return
#     grim -g "$P" -t ppm - | magick - -format '#%[hex:p{0,0}]\n' info:
# }
#
# alias color='_get_color'
alias d='_fzf_home_directories'
bind -m emacs-standard -x '"\C-r": _fzf_history'

