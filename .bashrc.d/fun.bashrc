#!/bin/bash
# vim: filetype=sh :
# vim: syntax=sh :

_fzf_home_directories() {
    local DIR
    DIR=$(fd -t directory \
        -E "Music/samples/*" \
        -E "Videos/*" \
        -E ".config/REAPER/*" \
        -E ".config/BraveSoftware/*" \
        -E ".config/SuperCollider/*" \
        -E "~/.local" \
        -E .git -E .cache -H -d4 . ~/ | fzf --tac ) && cd "$DIR"
}

_fzf_history() {
    READLINE_LINE=$(history | cut -c8- | awk '!x[$0]++' | fzf --tac) || return
    READLINE_POINT=${#READLINE_LINE}
}

# _vifm_cd()
# {
#     local dst
#     dst="$(vifm --choose-dir - "$@")" || return 1
#     cd "$dst"
# }

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
                        text/*|*/x-setupscript|*/javascript|*/json|*/x-elc)
                            cat {} ;;
                        *)
                            file --mime-type -Lb {} ;;
                    esac')
        case $(file --mime-type -Lb "$file") in
            inode/directory)
                cd "$file" ;;
            text/*|*/x-setupscript|*/javascript|*/json|*/x-elc)
                vi "$file"; break ;;
            */jpg|*/jpeg|*/png)
                (imv-dir "$file" &); break ;;
            */epub+zip|*/pdf)
                (zathura "$file" 2> /dev/null &); break ;;
            *)
                break ;;
        esac
    done
}

color() {
    local p; p="$(slurp -p)" || return
    grim -g "$p" -t ppm - | magick - -format '#%[hex:p{0,0}]\n' info:
}

