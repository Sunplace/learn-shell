#!/bin/bash
# Author:               aigo
# Date:                 2016.08.24
# Descriptions:         study shell script,the script aim to probe how many exits of a internal.
# details:              tracerout to many china domain name,to determine all exit of a internal,the first ips that isn't internal ip may be not tthe exit ips, so ,this is a joke.

max_hop=6               #the max hop that reach the internet.
set -a ipfields         #change ip'192.168.1.1' to ipfields[0]= 192 ,then respectively.
for domain in `cat china-domains.txt`; do
    echo "domain is $domain"
    for ip in `traceroute -n $domain -m $max_hop | tail -n $max_hop | cut -d' ' -f4 | tee /dev/tty`; do
        echo "ip is $ip"
        #perhaps the ip is * stand for the the ip not respone,then $* = china-domains.txt
        if [ $ip = "china-domains.txt" ]; then
            continue
        fi
        index=0
        for i in `echo $ip | awk -F '.' '{print $1"\n"$2"\n"$3"\n"$4}'`; do
            ipfields[index]=$i;
            let index=index+1;
        done
        echo ${ipfields[0]},${ipfields[1]},${ipfields[2]},${ipfields[3]}
        #if the ip is in 10.0.0.0/8,then it is a internal ip
        if [ ! ${ipfields[0]} -ne 10 ]; then
            #echo "domain:$domain exit ip is $ip"
            continue
        fi
        #if the ip is in 192.168.0.0/16, then it is a internal ip
        if [ ! ${ipfields[0]} -ne 192 -a ! ${ipfields[1]} -ne 168 ]; then
            continue
        fi
        # if the ip is in 172.16.0.0/12
        if [ ! ${ipfields[0]} -ne 172 ] && [ ${ipfields[1]} -ge 16 ] && [ ${ipfields[1]} -le 31 ]; then
            continue
        fi
        #here it is real internet ip
        echo "domain:$domain exit ip is $ip"
        break
    done
done
        







