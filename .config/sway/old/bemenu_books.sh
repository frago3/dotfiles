#!/bin/bash

find $bookspath -type f -iname '*.pdf' -printf "%AD %AT %f\n" |
    sort -nr -t"/" -k3 -k1 -k2 | cut -d ' ' -f 3- |
    bemenu -p 'books' | { 
        
        IFS= read -r chosen
        
        [ "$chosen" ] &&
        coproc zathura "$(find $bookspath -name "$chosen" -print -quit)" > /dev/null 2>&1
    }
