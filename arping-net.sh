#!/bin/bash
# Author:               aigo
# Date:                 2016.11.21
# Descriptions:         to obtain the ethernet address of host that live in current network

IPADDRESS=`ifconfig $1 | grep ' inet ' | awk -F ' ' '{print $2}'`
IPMASK=`ifconfig $1 | grep ' inet ' | awk -F ' ' '{print $4}'`

#echo $IPADDRESS $IPMASK

if [ -z $IPADDRESS ]; then
    echo "$1 hasn't ip address"
    exit
fi

#HOSTMIN=`ipcalc $IPADDRESS $IPMASK | grep HostMin | cut -f2`
#HOSTMAX=`ipcalc $IPADDRESS $IPMASK | grep HostMax | cut -f2`
NETMASK=`ipcalc $IPADDRESS $IPMASK -p | cut -d'=' -f2`

echo "network prefix=$NETMASK"

for IP in `nmap -n -sL $IPADDRESS/$NETMASK | grep "scan report" | cut -d' ' -f 5`
do
    echo $IP
    arping -I $1 $IP -f -w 2 2>/dev/null | grep "reply" | grep -v "connect" | tee -a /tmp/arping-alive-ip.list
done


