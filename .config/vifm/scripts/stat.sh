#!/bin/bash

file -b $1
stat --printf="Access: %a %U/%G\n" $1
