#!/bin/bash

for user in $(cut -d: -f1 /etc/passwd); do
    if [ -d "/home/$user" ]
    then
        last_login_date=0
        days_since_login=0

        file_count=$(find /home/$user -type f 2>/dev/null | wc -l)
        disk_usage=$(du -sh /home/$user 2>/dev/null)
        last_login=$(last -F "$user" | head -n 1 | awk '{print $4, $5, $6, $7}')
        current_date=$(date +%s)

        if [ -n "$last_login" ]
        then
            last_login_date=$(date -d "$last_login" +%s 2>/dev/null)
            days_since_login=$(( (current_date - last_login_date) / 84600 ))
        fi

        account_status=$(sudo passwd -S "$user")
        echo "User: $user"
        echo " Total number of files: $file_count"
        echo " Total disk usage: $disk_usage"
        echo "  Last login: $last_login"
        echo "  Days since last login: $days_since_login"
        echo -e "  Account status: $account_status\n"
        if [ "$days_since_login" -gt 7 ]; then
            echo "User $user has not logged in for more than one week."
        fi
    fi
done

