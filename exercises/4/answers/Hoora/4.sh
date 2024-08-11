#!/usr/bin/env bash

echo -e "\033[1mLIST OF USERS:\033[0m"

for USR in $(cut -d: -f1 /etc/passwd)
do
	TOTAL_FILES=$(find /home -type f -user $USR | wc -l)
	USER_HOME="/home/${USR}"

	if [ -d ${USER_HOME} ]
	then
		TOTAL_DISK_USAGE=$(du -sh ${USER_HOME} | cut -f1)
	else
		TOTAL_DISK_USAGE=0
	fi
	
#	TOTAL_DISK_USAGE=0
#	for FILE in $(find /home -type f -user $USR)
#	do
#		((TOTAL_DISK_USAGE += $(sudo du -s ${FILE} | cut -f1)))  		
#	done	

#	if [ -z $(lastlog --before 7 | grep ${USR}) ]
#	then
#		ACCOUNT_STATUS="inactive"
#	else
#		ACCOUNT_STATUS="active"
#	fi

	if [ -z $(last -s "1 week ago" | grep ${USR}) ]
	then
		ACCOUNT_STATUS="inactive"
	else
		ACCOUNT_STATUS="active"
	fi


	echo -e "\n\tuser : ${USR}"
	echo -e "\ttotal files : ${TOTAL_FILES}"
	echo -e "\ttotal disk usage : ${TOTAL_DISK_USAGE}"
	echo -e "\taccount status : ${ACCOUNT_STATUS}"
done


