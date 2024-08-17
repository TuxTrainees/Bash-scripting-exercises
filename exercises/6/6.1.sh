#!/usr/bin/env bash

CPU_THRESHOLD=80
MEM_THRESHOLD=75
DISK_THRESHOLD=90

LOG_FILE="/var/log/system_monitor.log"

EMAIL="yassaberi97@gmail.com"
SUBJECT="system alert"

check_usage() {
    CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')
    MEM_USAGE=$(free | awk '/Mem/ {print $3/$2 * 100.0}')
    DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

    echo "$(date):CPU:$CPU_USAGE%,Memory:$MEM_USAGE%,Disk:$DISK_USAGE%" >> $LOG_FILE

    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        echo "CPU usage is above standard" | mail -s "$SUBJECT" $EMAIL
    fi

    if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        echo "Memory usage is above standard" | mail -s "$SUBJECT" $EMAIL
    fi

    if (( $DISK_USAGE > $DISK_THRESHOLD )); then
        echo "Disk usage is above standard" | mail -s "$SUBJECT" $EMAIL
    fi
}

while true; do
    check_usage
    sleep 60
done
