#!/usr/bin/env bash

echo -e "\033[1mLIST OF USERS:\033[0m"

USERS=$(cut -d ':' -f 1 /etc/passwd)

for USER in ${USERS[@]}
do
	TOTAL_FILES=$(find /home -type f -user $USER | wc -l)
	USER_HOME="/home/${USER}"

	if [ -d ${USER_HOME} ]
	then
		TOTAL_DISK_USAGE=$(du -sh ${USER_HOME} | cut -f 1)
	else
		TOTAL_DISK_USAGE=0
	fi

	if [[ $(last -s "1 week ago" | grep ${USER}) ]]
	then
		ACCOUNT_STATUS="active"
	else
		ACCOUNT_STATUS="inactive"
	fi


	echo -e "\n\tuser : ${USER}"
	echo -e "\ttotal files : ${TOTAL_FILES}"
	echo -e "\ttotal disk usage : ${TOTAL_DISK_USAGE}"
	echo -e "\taccount status : ${ACCOUNT_STATUS}"
done


