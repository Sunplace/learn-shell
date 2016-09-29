#!/bin/bash
# Author:               aigo
# Date:                 2016.09.22
# Descriptions:         cron job,hourly exec this script,collect some infomations of some servers,send the informations to admin's email box.if the server have bad behaviours, instantly send message to amdin's email box.

SERVERS=(
    'ssserver'
    'dnscrypt-proxy'
    'dnscrypt-wrapper'
    'firefox'
)


date | tee /tmp/servers.info
for i in `seq 0 $[ ${#SERVERS[@]}-1 ]`; do
    RESULT=`ps -e -o 'pid,comm,args,%cpu,%mem,rsz,etime' | grep "${SERVERS[$i]}" | grep -v grep`
    if [ $? -gt 0 ]; then
        echo "${SERVERS[$i]} : no such server" | tee -a /tmp/servers.info
        continue
    fi
    MESSAGE=${SERVERS[$i]}" : ""`echo $RESULT | awk '{print "pid:"$1"\tname:"$2"\tcmd:"$3"\tcpu(%):"$4"\tmem(%):"$5"\trsz(kB):"$6"\tetime:"$7}'`"
    echo $MESSAGE | tee -a /tmp/servers.info
done

#send the file /tmp/servers.info to admin's email

cat /tmp/servers.info
#delete the tmp file
rm /tmp/servers.info

