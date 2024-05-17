#!/bin/bash

# find ~/Documentos/books/ -type f -exec stat --format='%X %n' {} + | sort -n

# find "$BOOKS" -type f -iname '*.pdf' -printf "%AD %AT %f\n" | sort -nr -t"/" -k3 -k1 -k2
# find "$BOOKS" -type f -iname '*.pdf' -printf "%A@ %p\n"|sort
books=$(find ~/Documentos/books/ -type f -printf "%A@ %p\n"|sort -nr)

echo "$books" | cut -d' ' -f2- |
  fzf | { IFS= read -r chosen

    echo "$chosen" 
    echo "$books" | awk '{print}'
    # [ "$chosen" ] &&
    # coproc zathura "$(find "$BOOKS" -name "$chosen" -print -quit)" > /dev/null 2>&1
  }
