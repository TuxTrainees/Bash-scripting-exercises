#!/bin/bash

USER="$USER"
read -s -p "Enter your password: " PASSWORD
echo

if sudo -lU "$USER" &>/dev/null; then
    echo "User '$USER' is in the sudo or wheel group."
    ls /root
else
    echo "User '$USER' is not in the sudo or wheel group."
fi

