#!/bin/bash
# Author:               aigo
# Date:                 2016.08.24
# Descriptions:         study shell script,test the getopts usage

while getopts abc: arguments 2> /dev/null
do
    case $arguments in
        a) echo "used -a option"
            ;;
        b) echo "used -b option"
            ;;
        c) echo "used -c option"
            echo "-c option's optarg is $OPTARG"
            ;;
        ?) echo "error,usage: ./command [-ab] [-c argument]"
            exit 1
            ;;
    esac
done
echo "arguments number is $(($OPTIND-1))"
