#!/bin/bash

# while true
# do
#     FILE="$(fd --color never -E Music| fuzzel -d --prompt="${PWD##*/} ")" || exit
#     [ -e "$FILE" ] || exit
#     case $(file --mime-type -Lb "$FILE") in
#         inode/directory)
#             cd "$FILE" ;;
#         *)
#             coproc $(xdg-open "$FILE") ; exit ;;
#     esac
# done

FILE="$(fd --color never -E cva '\.(jpg|jpeg|png|pdf)$' | fuzzel -d --prompt='file ' )" || exit

coproc $(xdg-open "$FILE")

