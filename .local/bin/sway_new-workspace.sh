#!/bin/bash

swaymsg -pt get_workspaces |
awk '/^Workspace / { 
        w=$2
        if(w > ++i) {s=i; exit}
    }
    END {print s? s: ++w }' | xargs swaymsg workspace

