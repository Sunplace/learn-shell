#!/bin/bash

# File: minus tow hours
# Description: display the time that minus current time
# Version: 0.0.1
# Last Change: 2017.02.16
# License: GPL v2
# Author: aigo <sunyangjianaigo@gmail.com>

minus-two-hours() {
	date --date="$1 +1000" +"%F %H:%M" | \
	{
		IFS=": " read -a COMP
		echo "${COMP[0]} $((10#${COMP[1]})):${COMP[2]}"
	}
}

minus-two-hours now
minus-two-hours "2016/11/21 05:27:18"
minus-two-hours "2016/11/21 01:10:42"

# solution 1
minus-two-hours-1() {
	SRC=$(date -d "$1" +"%s")
	# convert to seconds since Unix Epoch
	DST=$((SRC - 2*60*60))
	# remove two hours
	date -d "@$DST" +"%F %H:%M"
	}

minus-two-hours-1 now
minus-two-hours-1 "2016/11/21 05:27:18"
minus-two-hours-1 "2016/11/21 01:10:42"

# solution 2
minus-two-hours-2() {
	date -d "$1 2 hours ago" +"%F %H:%M"
	}

minus-two-hours-2 now
minus-two-hours-2 "2016/11/21 05:27:18"
minus-two-hours-2 "2016/11/21 01:10:42"
