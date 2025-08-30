#!/bin/bash

FILE="$(fd --color never -E cva '\.(jpg|jpeg|png|pdf|epub|org)$' | fuzzel -dp 'file ' )" || exit

coproc $(xdg-open "$FILE")

