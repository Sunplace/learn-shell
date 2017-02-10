#!/bin/bash
# Author:               aigo
# Date:                 2017.02.09
# Descriptions:         sum function

declare -i SUM=0
while read X ; do
    SUM+=$((10#$X))
done < sample.data
echo "SUM is: $SUM"
