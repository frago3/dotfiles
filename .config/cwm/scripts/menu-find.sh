#!/bin/bash

_find() {
    fd -cnever -td -d5 . ~/ &
}

file=$(_find | sort | cut -c10- | dmenu -p 'find') || exit

[ -d "$HOME/$file" ] && cd "$file" && (pcmanfm-qt &)
