#!/bin/bash
# Author:           aigo
# Date:             2016.08.23
# Descriptions:     study shell script,calculate the sum of 2,4,6,...,98,100

sum=0
for I in {1..50}; do
    sum=$(($sum+2*$I))
done
echo "the sum is:$sum"
