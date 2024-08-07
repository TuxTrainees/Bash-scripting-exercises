#!/bin/bash
USER="$USER"
read -s -p "Enter password for $USER: " PASSWORD
echo
if groups "$USER" | grep -qE '\bsudo\b|\bwheel\b'; then
    echo "User $USER is in the sudo or wheel group./root directory:"
    echo -S <<< "$PASSWORD" ls /root
else
    echo "error"
fi
