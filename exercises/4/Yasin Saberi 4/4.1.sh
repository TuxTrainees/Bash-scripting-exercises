#!/usr/bin/env bash

REPORT_FILE="user_report.txt"
echo "user report - $(date)" > $REPORT_FILE
echo "----------------------------------------" >> $REPORT_FILE

for USER in $(cut -d: -f1 /etc/passwd); do
    HOME_DIR="/home/$USER"
    
    if [ -d "$HOME_DIR" ]; then
        FILE_COUNT=$(find $HOME_DIR -type f | while read; do ((count++)); done; echo $count)
        
        DISK_USAG=$(du -sh $HOME_DIR | while read size _; do echo $size; done)
        
        echo "user: $USER" >> $REPORT_FILE
        echo "number of files: $FILE_COUNT" >> $REPORT_FILE
        echo "disk usage: $DISK_USAG" >> $REPORT_FILE
        echo "----------------------------------------" >> $REPORT_FILE
    fi
done

echo "users who haven't logged in for over a week:" >> $REPORT_FILE
lastlog -b 7 | grep -v "Username" | while read user _; do echo $user; done >> $REPORT_FILE
