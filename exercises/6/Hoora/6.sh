#!/usr/bin/env bash

CPU_USAGE_THRESHOLD=80
MEMORY_USAGE_THRESHOLD=75
DISK_USAGE_THRESHOLD=90

LOG_FILE="/home/hoora/Desktop/logFile.txt"

EMAIL="hoora.akhlaghi83@gmail.com"

if [ ! -f ${LOG_FILE} ]
then
	touch -p ${LOG_FILE}
fi

while true
do
	CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {print 100 - $12}')
	MEMORY_USAGE=$(free | awk '/Mem:/ {print $3/$2 * 100}')
	DISK_USAGE=$(df / | awk '/\/dev/ {print $5}')
	
	echo "Date : $(date)" >> ${LOG_FILE}
	echo "CPU usage : ${CPU_USAGE}%" >> ${LOG_FILE}
	echo "Memory usage : ${MEMORY_USAGE}%" >> ${LOG_FILE}
	echo -e "Disk usage : ${DISK_USAGE}%\n" >> ${DISK_USAGE}


	if [ $(echo "${MEMORY_USAGE} > ${MEMORY_USAGE_THRESHOLD}" | bc -l) ]
	then
		echo "CPU usage is at ${CPU_USAGE}%!"| mail -s "CPU usage alert" ${EMAIL}
	fi
	
	if [ $(echo "${MEMORY_USAGE} > ${MEMORY_USAGE_THRESHOLD}" | bc -l) ]
	then
		echo "Memory usage is at ${MEMORY_USAGE}%!" | mail -s "Memory usage alert" ${EMAIL}
	fi

	if [ $(echo "${DISK_USAGE} > ${DISK_USAGE_THRESHOLD}" | bc -l) ]
	then
		echo "Disk usage is at ${DISK_USAGE}%!" | mail -s "Disk usage alert" ${EMAIL}
	fi


	sleep 60
done
