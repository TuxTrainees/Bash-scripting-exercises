#!/usr/bin/env bash

TASK_FILE=$1

clear
echo -e "\033[1m\t\tLIST OF TASKS\033[0m"

if [ ! -f ${TASK_FILE} ]
then
	echo "There is nothing to do"
	exit 1
fi

while IFS=':' read -r TASK_ID DESCRIPTION DUE_DATE STATUS
do
	echo -e "\n\tTASK ID: ${TASK_ID}"
	echo -e "\tDESCRIPTION: ${DESCRIPTION}"
	echo -e "\tDUE DATE: ${DUE_DATE}"
	echo -e "\tSTATUS: ${STATUS}"
done < ${TASK_FILE}

sleep 5
clear
