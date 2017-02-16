#!/bin/sh

# File: pipeline_file.sh
# Description: pipeline,file,race condition
# Version: 0.0.1
# Last Change: 2017.02.13
# License: GPL v2
# Author: aigo <sunyangjianaigo@gmail.com>

#how to insert HEADER file on the top of DATA01 file

cat HEADER DATA01 | tee DATA01
# in a pipeline, all commands are launched in parallel.
# this is a race condition.
cat HEADER DATA01 | (sleep; tee DATA01)
(sleep 1; cat HEADER DATA01) | tee DATA01

# the kiss solution
cat HEADER DATA01 > DATA01.NEW
mv -f DATA01.NEW DATA01

# A somewhat similar solution
exec 3<DATA01
rm -f DATA01
cat HEADER - <&3 >DATA01
exec 3<&-

# using sed
set -i '1{
	r HEADER
	N
}' DATA01

# using ed or ex
ed DATA01 << .
0r HEADER
wq
.

ex -s DATA01 << .
0r HEADER
wq
.
