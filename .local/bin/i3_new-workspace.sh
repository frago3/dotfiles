#!/bin/bash

i3-msg -t get_workspaces | jq '.[] |.num' |
awk '{ 
        w=$1
        if(w > ++i) {s=i; exit}
    }
    END {print s? s: ++w }' | xargs i3-msg -q workspace
