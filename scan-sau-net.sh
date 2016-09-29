#!/bin/bash
# Author:               aigo
# Date:                 2016.09.15
# Descriptions:         study shell script,the script aim to probe the the number of the host in the sau.edu.cn.show the differences of the number of the host from the internal perspective and the internet .

# sau.edu.cn hold the domain 202.199.24.0-202.199.31.255

let i=24
let j=1
pingnet="202.199"
while [ $i -le 31 ]; do
    let j=1
    while [ $j -le 254 ]; do
        ping -c3 -W1 $pingnet.$i.$j &>/dev/null
        ping_ret=$?
        ttl=`ping -c1 -W1 $pingnet.$i.$j | grep ttl | cut -f6 -d' ' | cut -d'=' -f2`
        [ $ping_ret -eq 0 ] && echo "$pingnet.$i.$j online.ttl=$ttl" || echo "$pingnet.$i.$j offline."
        let j++
    done 
    let i++
done
