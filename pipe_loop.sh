#!/bin/bash
# Author:               aigo
# Date:                 2016.08.30
# Descriptions:         study shell script,use pipe to connect the loop and other commands

file="/etc/passwd"
for I in 2 1 7 9 5 4; do
    echo "$I"
done | sort -n
