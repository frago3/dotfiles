#!/bin/bash
# vim: filetype=sh :
# vim: syntax=sh :

_fzf_home_directories() {
    local dir
    dir=$(fd -cnever -t directory -d4 -H -E .cache -E .git -E BraveSoftware . ~/ | fzf --tac ) && cd "$dir"
}

_fzf_ls() {

    [ -d "$1" ] && cd "$1"
    while true
    do
        local file
        file=$(command ls -pav --group-directories-first --color |tail -n+2| fzf --ansi --prompt="${PWD##*/} " \
            --bind='right:preview:
                    case $(file --mime-type -Lb {}) in
                        inode/directory)
                            command ls -Av --group-directories-first --color=always {} ;;
                        text/*|*/x-setupscript|*/javascript|*/json)
                            cat {} ;;
                        *)
                            file --mime-type -Lb {} ;;
                    esac')
        case $(file --mime-type -Lb "$file") in
            inode/directory)
                cd "$file" ;;
            text/*|*/x-setupscript|*/javascript|*/json)
                eval "vi $file"; break ;;
            *)
                break ;;
        esac
    done
}

_fzf_history() {
    READLINE_LINE=$(history | cut -c8- | awk '!x[$0]++' | fzf --tac) || return
    READLINE_POINT=${#READLINE_LINE}
}
bind -m emacs-standard -x '"\C-r": _fzf_history'

color() {
    local p; p="$(slurp -p)" || return
    grim -g "$p" -t ppm - | magick - -format '#%[hex:p{0,0}]\n' info:
}
