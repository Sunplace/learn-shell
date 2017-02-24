#!/bin/sh

# File: ping-probe.sh
# Description: ping a server, and log the date and rtt
# Version: 0.0.1
# Last Change: 2017.02.14
# License: GPL v2
# Author: aigo <sunyangjianaigo@gmail.com>

probe()(
	ping -qnc2 www.baidu.com | \
			grep rtt && \
			date +'OK %D %T'
	)
probe >> log
