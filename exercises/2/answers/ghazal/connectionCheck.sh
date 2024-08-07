#!/usr/bin/bash

IP=$(ip route | grep default)

if [[ -z "$IP" ]] then
   notify-send "you have any connection" "disconnect"
else 
   ping -c 1 8.8.8.8 > /dev/null
   if [ $? -eq 0 ]
   then
      notify-send "you have a connection" "connection successful"
   else 
      notify-send "you have a connection without internet" "connection unsuccessful"
   fi
fi

