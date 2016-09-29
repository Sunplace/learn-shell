#!/bin/bash
# Author:               aigo
# Date:                 2016.09.28
# Descriptions:         probe ftp server,determine if it can be log in anonymous or not.
# reference:            https://github.com/massivedynamic/openftp4

respones=$(echo -e "user anonymous anonymous@\nquit\n" | timeout -k1 5 ftp -v -d -n "$1" 2>/dev/null)
if [[ $respones =~ "230" ]]; then
    echo "$1 respones: $respones"
else
    echo "$1 respones: $respones"
fi


