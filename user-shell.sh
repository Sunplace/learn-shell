#!/bin/bash
# Author:               aigo
# Date:                 2016.08.23
# Descriptions:         study shell script,enter a user name,check out if the user exist,if the user exist,then display his default shell

read -p "please enter a user name:" USER
if cut -d : -f1 /etc/passwd | grep "^$USER$" &> /dev/null ; then
    USER_SHELL=`grep "^$USER" /etc/passwd | cut -d : -f7`
    echo "${USER}'s shell is $USER_SHELL"
else
    echo "$USER not exists."
    exit 1
fi
