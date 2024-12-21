#!/bin/bash

_find() {
    fd -Hcnever -td -d4 -E .git . ~/.dotfiles/ &
    fd -cnever -td -d5 -E Public . ~/ &
}
d() {
    local dir
    dir=$(_find |fzf) && cd "$dir"
}

f() {
    [ -d "$1" ] && cd "$1"
    while true
    do
        local file
        file=$(command ls -pav --group-directories-first |tail -n+2| fzf --prompt="${PWD##*/} " \
            --bind='tab:accept,right:preview:
                    case $(file --mime-type -Lb {}) in
                        inode/directory)
                            command ls -Av --group-directories-first --color=always {} ;;
                        text/*|application/x-setupscript|application/javascript|application/json|inode/x-empty)
                            cat {} ;;
                        *)
                            file --mime-type -Lb {} ;;
                    esac' ) || break

        case $(file --mime-type -Lb "$file") in
            inode/directory)
                cd "$file" ;;
            text/*|application/x-setupscript|application/javascript|application/json)
                vi "$file"; break ;;
            image/*)
                (imv-dir "$file" &); break ;;
            *)
                break ;;
        esac
    done
}

_history() {
    # READLINE_LINE=$(history|fzf --tac|cut -c8-) || return
    READLINE_LINE=$(history|cut -c8-|awk '!x[$0]++'|fzf --tac) || return
    [ "$READLINE_POINT" ] || echo "$READLINE_LINE" && READLINE_POINT=0x7fffffff
}
bind -m emacs-standard -x '"\C-r": _history'

color() {
    local p
    p=$(slurp -p) && 
    grim -g "$p" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:- | awk '{if(NR==2)print $3}'
}
