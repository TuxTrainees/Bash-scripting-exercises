#!/bin/bash

while true; do
    if ping -c 1 "www.google.com"; then
        notify-send "Internet" "Connected!"
    else
        notify-send "Ops!" "NO Internet connection!"
    fi
    sleep 20
done
