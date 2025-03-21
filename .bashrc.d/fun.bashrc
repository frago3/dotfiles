# vim: filetype=sh :
# vim: syntax=sh :
#!/bin/bash

__home_directories() {
    # fd -cnever -td -d4 . ~/
    # fd -cnever -td -HE .git -E share/ . ~/.dotfiles/
    find ~/ -maxdepth 3 -type d -not -path "*/.*"
    find ~/.dotfiles/ -type d -not -path "*.local/share/*" -not -path "*.git/*"
}
_fzf_home_directories() {
    local dir
    dir=$(__home_directories |fzf) && cd "$dir"
}
_fzf_ls() {
    [ -d "$1" ] && cd "$1"
    while true
    do
        local file
        file=$(command ls -pav --group-directories-first |tail -n+2| fzf --prompt="${PWD##*/} " \
            --bind='right:preview:
                    case $(file --mime-type -Lb {}) in
                        inode/directory)
                            command ls -Av --group-directories-first --color=always {} ;;
                        text/*|*/x-setupscript|*/javascript|*/json|inode/x-empty)
                            cat {} ;;
                        *)
                            file --mime-type -Lb {} ;;
                    esac' )
        case $(file --mime-type -Lb "$file") in
            inode/directory)
                cd "$file" ;;
            text/*|*/x-setupscript|*/javascript|*/json)
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
