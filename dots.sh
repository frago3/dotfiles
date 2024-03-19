#!/bin/bash

ROOTS="
$HOME/.dotfiles
$HOME/.dotfiles/.config
$HOME/.dotfiles/.local
$HOME/.dotfiles/.local/share
$HOME/.dotfiles/Imágenes
"
IGNORE="
$HOME/.dotfiles/dots.sh
$HOME/.dotfiles/.git
"

filter() {
  awk -v ignore="$ROOTS$IGNORE" '
  { list[$0]++ }
  END {
    for (file in list) if (!match(ignore, file))
      print file
  }' <<< "$1" | LC_COLLATE=C sort
}

get_dots() {
  local root
  for root in $ROOTS; do
    find $root -maxdepth 1
  done
}

TARGETS="$(filter "$(get_dots)")"

show() {
  [ ! -L $link_name ] && link_name=''
  printf "%-46s %s\n" $target "->  ${link_name:-:(}"
}
stow() {
  [ ! -L $link_name ] && ln -sv $target $link_name
}
delete() {
  [ -L $link_name ] && rm -v $link_name
}

dots () {
  for target in $TARGETS; do link_name=${target/.dotfiles\//}
  
    case $1 in
      stow) stow;;
      delete) delete;;
      *) show;;
    esac

  done
}

dots $1
