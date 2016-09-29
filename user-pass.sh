#!/bin/bash
# Author:               aigo
# Date:                 2016.08.24
# Descriptions:         study shell script,select some lines of /etc/passwd ,write them into /tmp/pass

file="/etc/passwd"
exec 3> /tmp/passwd
for I in 2 4 6 10 13 15; do
    line=`head -$I $file | tail -1`
    echo "$line"
    echo "$line" >&3
done
exec 3>&-
