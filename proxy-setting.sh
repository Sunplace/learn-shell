#!/bin/sh

# File: proxy-setting.sh
# Description: terminal proxy setting
# Version: 0.0.1
# Last Change: 2017.03.22
# License: GPL v2
# Author: aigo <sunyangjianaigo@gmail.com>

export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
export http_proxy="http://$1"
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
