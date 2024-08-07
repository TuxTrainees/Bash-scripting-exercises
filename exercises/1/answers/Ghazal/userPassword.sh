#!/usr/bin/bash

USER_NAME=$USER
echo -n "Enter password for $USER_NAME: "
read -s PASSWORD
echo

if (groups "$USER_NAME" ) | (grep -qw 'wheel' || grep -qw 'sudo');then
   echo "contents of /root:"
   ls /root
fi


