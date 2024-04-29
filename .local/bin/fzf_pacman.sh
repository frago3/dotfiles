#!/bin/bash

pacman -Qeq |
    fzf --bind='right:preview: pacman -Qi {}' \
        --preview-window=75%

