#!/bin/bash

hyprctl clients|
  awk '
    /workspace:/ {printf "%s",$2}
    /class:/ {$1=""; printf "%s -",$0}
    /title:/ {$1=""; print}
  '|sort -n -k1 
