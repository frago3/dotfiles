#!/bin/bash

command ls /usr/bin/ | bemenu -p run | {
    IFS= read -r cmd
    [ $cmd ] && ($cmd &)
}
