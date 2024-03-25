fileselectorfzf() {

    [ -d "$1" ] && cd "$1"

    while true
    do
        local selected=$(echo -e "./\n../\n$(command ls -pv --group-directories-first)" \
            | fzf \
                --bind=tab:accept \
                --bind='right:preview:
                    case $(file --mime-type {}) in
                        *text/*|*inode/x-empty|*/javascript|*/json|*/x-setupscript)
                            cat {} ;;
                         *inode/directory)
                            command ls -Fv --group-directories-first {} ;;
                         *inode/symlink)
                            readlink -f {} ;;
                         *)
                            file --mime-type {} ;;
                    esac' \
                --preview-window=70% \
                --prompt="  $PWD ")

        case $(file --mime-type "$selected") in
            *inode/directory)
                cd "$selected" ;;

            *text/*|*application/javascript|*application/json)
                vim "$selected"; break ;;

            *image/*)
                ~/.local/bin/w_nsxiv.sh "$PWD/$selected"; break ;;

            *inode/symlink)
                case $(file --mime-type "$(file -b "$selected" | cut -d' ' -f4-)") in
                    *inode/directory) cd "$selected" ;;
                esac ;;
            *)
                break ;;
        esac

    done
}

# /: Directorio.
# *: Archivo ejecutable.
# @: Enlace simbólico.
# |: Pipe (tubería).
# =: Socket.
# %: Archivo de respaldo