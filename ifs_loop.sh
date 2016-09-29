#!/bin/bash
# Author:               aigo
# Date:                 2016.08.30
# Descriptions:         study shell script,IFS as the separete tag

names="root:admin:apache:ftp:daemon"
oldifs="$IFS"
IFS=":"
for i in $names
do
    echo "$i"
done

echo "---------------"
IFS="$oldifs"
names="root admin apache ftp daemon"
for name in $names
do
    echo "$name"
done

