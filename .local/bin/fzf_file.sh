#!/bin/bash

fz() {
    file=$(fd -c never -LaH -E .cache/ -E .mozilla/ -E .dotfiles/ . "$HOME" | fzf)

    [ "$file" ] && {
        case "$(file --mime-type -Lb "$file")" in

            text/x-shellscript|text/plain|application/javascript|application/json)
                cd "$(dirname "$file")" && vi "$file" ;;
            
            inode/directory)
                cd "$file" ;;
                
            *)
                echo "$file" ;;
        esac
    }
}

f() {

    [ -d "$1" ] && cd "$1"

    while true
    do
        # local file=$(echo -e "./\n../\n$(command ls -pv --group-directories-first)" \
        local file=$(command ls -pav --group-directories-first \
            | fzf \
                --bind=tab:accept \
                --bind='right:preview:
                    case $(file --mime-type -Lb {}) in
                        text/x-shellscript|text/plain|application/javascript|application/json)
                            cat {} ;;
                         inode/directory)
                            command ls -Fv --group-directories-first {} ;;
                         *)
                            file --mime-type {} ;;
                    esac' \
                --preview-window=70% \
                --prompt="  $PWD ")

        case $(file --mime-type -Lb "$file") in
            inode/directory)
                cd "$file" ;;

            text/x-shellscript|text/plain|application/javascript|application/json)
                vi "$file"; break ;;

            *)
                break ;;
        esac

    done
}
