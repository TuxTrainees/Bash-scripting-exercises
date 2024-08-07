#!/bin/bash
Title_1="Internet Issue"
Title_2="Network Issue"
Message_1="1Connected to network but no internet access."
Message_2="2Not connected to any network adapter."

while true; do

  if ping -c 1 8.8.8.8 &> /dev/null; then

    sleep 10
  else

    if ip link show | grep -q 'state UP'; then
      notify-send "$Title_1" "$Message_1"
    else
      notify-send "$Title_2" "$Message_2"
    fi

    sleep 10
  fi
done
