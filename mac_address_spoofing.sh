#!/bin/bash
# Author:               aigo
# Date:                 2018-04-02
# Descriptions:         mac address spoofing

# first set the interface down
ip link set dev interface down

# set the new address
ip link set dev interface address XX:XX:XX:XX:XX:XX

# set the interface up
ip link set dev interface up
