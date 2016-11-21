#!/bin/bash
# Author:               aigo
# Date:                 2016.11.14
# Descriptions:         list all ip addresses of the network that the host live in

IPADDRESS=`ifconfig $1 | grep ' inet ' | awk -F ' ' '{print $2}'`
IPMASK=`ifconfig $1 | grep ' inet ' | awk -F ' ' '{print $4}'`

#echo $IPADDRESS $IPMASK

if [ -z $IPADDRESS ]; then
    echo "$1 hasn't ip address"
    exit
fi

HOSTMIN=`ipcalc $IPADDRESS $IPMASK | grep HostMin | cut -f2`
HOSTMAX=`ipcalc $IPADDRESS $IPMASK | grep HostMax | cut -f2`

#echo $HOSTMIN $HOSTMAX

if [ -z $HOSTMIN ]; then
    echo "perhaps network is point-to-point."
    exit
fi

### it's out of date
