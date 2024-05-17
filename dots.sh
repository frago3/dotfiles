#!/bin/bash

ROOTS="
$HOME/.dotfiles
$HOME/.dotfiles/.config
$HOME/.dotfiles/.local
$HOME/.dotfiles/.local/share
"
IGNORE="
$HOME/.dotfiles/dots.sh
$HOME/.dotfiles/.git
$HOME/.dotfiles/.gitignore
"

filter() {
    awk -v ignore="$ROOTS$IGNORE" '!match(ignore, $0) {print $0}' <<< "$1" \
        | LC_COLLATE=C sort
}
get_dots() {
    local root; local file
    shopt -s dotglob
    for root in $ROOTS; do
        for file in "$root"/*; do echo $file; done
    
    done; shopt -u dotglob
}

TARGETS="$(filter "$(get_dots)")"

print() {
    printf "%-46s %s\n" "$1" "$2"
}

show() {
    [ ! -L $link_name ] && {

        [ -e $link_name ] && print $target "     $link_name" || print $target "     :c"

    } || print $target "sym  $link_name"
}
stow() {
    [ ! -L $link_name ] && {
        
        [ -e $link_name ] && rm -r $link_name
        ln -sv $target $link_name
    }
}
delete() {
    [ -L $link_name ] && rm -v $link_name
}

for target in $TARGETS; do link_name=${target/.dotfiles\//}

    case $1 in

        stow)    stow;;

        delete)  delete;;

        *)       show;;
    esac
done
