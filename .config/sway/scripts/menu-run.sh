#!/bin/bash

command ls /usr/bin/ | fuzzel -dp 'drun ' | xargs -r setsid 
