#!/bin/bash

imagelist=$(file --mime-type "${1%/*}"/* | awk -F: '/: *image\//{ print $1 }')

coproc(echo "$imagelist" | nsxiv -in \
    $(awk -v f="$1" 'f == $0 { print NR; exit }' <<< "$imagelist"))
