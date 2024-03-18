#!/bin/bash

ROOTS="
$HOME/.dotfiles
$HOME/.dotfiles/.config
$HOME/.dotfiles/.local
$HOME/.dotfiles/.local/share
$HOME/.dotfiles/Imágenes
"

filter() {
  awk -v roots="$ROOTS" '
  { list[$0]++ }
  END {
    for (key in list) if (!match(roots, key))
      print key
  }' <<< "$1" | grep -v $0 | sort
}

get_dots() {
  local root
  for root in $ROOTS; do
    find $root -maxdepth 1
  done
}

TARGETS="$(filter "$(get_dots)")"

show() {
  local link_name=''
  [[ -L $2 ]] && link_name=$2
  printf "%-38s %s %s\n" "$link_name" '<-' $1
}
delete() {
  [[ ! -L $2 ]] && echo 'delete' $1
}
stow() {
  [[ ! -L $2 ]] && ln -sv $1 $2
}

dots () {
  for target in $TARGETS; do link_name=${target/.dotfiles\//}
    [ $1 == 'show' ] && show $target $link_name
    [ $1 == 'stow' ] && stow $target $link_name
    [ $1 == 'delete' ] && delete $link_name
  done
}

case "$1" in
  delete) dots 'delete';;
  stow) dots 'stow';;
  *) dots 'show';;
esac
