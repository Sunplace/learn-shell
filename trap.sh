#!/bin/bash
# Author:               aigo
# Date:                 2016.08.24
# Descriptions:         study shell script,trap function

function trapper () {
    trap 'echo "capture int signal"' INT
}

trapper
while :
do
    echo "sleeping..."
    sleep 1
done
