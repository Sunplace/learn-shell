#!/bin/bash

# File: zuiyou_server_log.sh
# Description: zuiyou interview test
# Version: 0.0.1
# Last Change: 2017.03.09
# License: GPL v2
# Author: aigo <sunyangjianaigo@gmail.com>


if [ ! -e /tmp/server_access.log ] ; then
		exit;
fi
# the number of every interface, sort with the big first
cat /tmp/server_access.log | cut -d' ' -f 2 | sort | uniq -c | sort -n -k 1 -r

# the number of interface the invoke time exceed 100ms
cat /tmp/server_access.log | awk '{if($3>0.1){print $2,$3}}' | cut -d' ' -f 1 | sort | uniq -c | sort -n -k 1 -r

# the average time of every interface
cat /tmp/server_access.log | awk '{a[$2]+=$3;b[$2]++} END{for (i in a) print i,a[i],b[i],a[i]/b[i]}'

# all requiled in all in one command
cat /tmp/server_access.log | awk 'BEGIN{printf "%-50s%-20s%-20s%-20s%-20s\n","Interface name","Sum time","Invoke number","average time","exceed number"} {a[$2]+=$3;b[$2]++;if($3>0.1){c[$2]++}} END{for (i in a){printf "%-50s%-20f%-20d%-20f",i,a[i],b[i],a[i]/b[i];if(!(c[i])){printf "%-20s\n","0"}else{printf "%-20d\n",c[i]}}}'
