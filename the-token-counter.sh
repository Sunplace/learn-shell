#!/bin/bash

# File: the-token-counter.sh
# Description: count the {red,blue} token
# Version: 0.0.1
# Last Change: 2017.02.12
# License: GPL v2
# Author: aigo <sunyangjianaigo@gmail.com>

## bash only

stream() {
		TOKENS=( "RED" "BLUE" )
		for ((i=0;i<100;i++)) ; do
				echo ${TOKENS[RANDOM%2]}
		done
}

# 1 solution
stream | grep -F RED | wc -l 
# 2 solution
stream | sort | uniq -c
#stream | tee >(wc -l) > /dev/null
# 3 solution
stream | tee >(grep -F RED | wc -l ) \
			 >(grep -F BLUE | wc -l ) \
			 > /dev/null
# 4 solution
declare -i RED=0 BLUE=0
for TOKEN in `stream` ; do
	case "$TOKEN" in
			RED) RED+=1
					;;
			BLUE) BLUE+=1
					;;
	esac
		done
echo $RED $BLUE
# 5 solution
stream | awk '
	/RED/ { RED++ } 
	/BLUE/ { BLUE++ } 
	END { printf "%5d %5d\n", RED, BLUE }'
# 6 solution
stream | awk '
	{ C[$0]++ }
	END { printf "%5d %5d\n", C["RED"], C["BLUE"] }'
