#!/bin/bash

file=$(fd -c never -LaH -E .cache/ -E .mozilla/ -E .dotfiles/ . "$HOME" | bemenu -p 'find')
[ "$file" ] && {

    case "$(file --mime-type -Lb "$file")" in

        text/x-shellscript|text/plain|text/xml|application/javascript|application/json)
            coproc foot -D "$(dirname $file)" vi "$file" ;;
        
        inode/directory)
            cd "$file"; coproc foot ;;

        image/png|image/gif|image/jpeg|image/jpg|image/bmp)
            coproc imv-dir "$file" ;;
            
        application/pdf|application/epub+zip)
            coproc zathura "$file" ;;

        *)
            exit ;;
    esac
}
