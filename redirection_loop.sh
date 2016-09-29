#!/bin/bash
# Author:               aigo
# Date:                 2016.08.30
# Descriptions:         study shell script,redirect the output of for loop to the tmpfile

file="/etc/passwd"
for I in 2 4 6 8; do
    line=`head -$I $file | tail -1`
    echo "$line" > /dev/tty
    echo "$line" 
done > /tmp/tmp$$
