#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --exact --no-info --preview-window=border-sharp --no-separator --marker="+" --color=gutter:-1,marker:110:bold'

alias start='~/.local/bin/sway_run.sh'
#
# [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && start
