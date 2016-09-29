#!/bin/bash
# Auther:           aigo
# Date:             2016.08.23
# Description:      study shell script,the max number of the three entered numbers

echo "please enter 3 numbers"
read -p "the first number is:" n1
read -p "the second number is:" n2
read -p "the third number is:" n3

let MAX=$n1
if [ $n2 -ge $MAX ]; then
    MAX=$n2
fi
if [ $n3 -ge $MAX ]; then
    MAX=$n3
fi
echo "the max is:$MAX"

