#!/bin/bash

while true;
do
	if ping -c 1 www.google.com;
	then
		echo "connected"
	else
		if nmcli device status | grep -q "connected";
		then
			notify-send "internet connection is lost but we are connected to an adapter"
		else
			notify-send "internet connection is lost"
		fi
	fi
	sleep 5
done
