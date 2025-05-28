#!/bin/bash

# FZF_DEFAULT_OPTS="-1 --no-info --no-separator --no-scrollbar --reverse --exact --prompt='▶ ' --color=prompt:4,gutter:-1,pointer:236,hl:15:bold,hl+:3 --preview-window=border-none,70%"
# FZF_DEFAULT_OPTS="-1 --no-info --no-separator --no-scrollbar --reverse --exact --prompt='▶ ' --color=16 --preview-window=border-none,70%"
# FZF_DEFAULT_OPTS="--no-info --no-separator --no-scrollbar --reverse --exact --color=prompt:4,gutter:-1,pointer:236,hl:3:bold,hl+:15 --preview-window=border-none,70%"
FZF_DEFAULT_OPTS="--no-info --no-separator --no-scrollbar --reverse --exact \
    --color=prompt:4,gutter:-1,pointer:236,hl:-1:underline,hl+:-1 \
    --preview-window=border-none,70%"
fd . ~/ | fzf --ansi
# command ls --color /usr/bin/ | fzf --ansi


