#!/usr/bin/env bash

TASK_FILE=$1

clear
echo -e "\033[1m\t\tMARK TASK AS COMPLETED\n\033[0m"

if [ ! -f ${TASK_FILE} ]
then
	echo "No Tasks Found"
	exit 1
fi

read -p "Enter Task ID to mark as completed: " TASK_ID

LINE_NUMBER=$(cat ${TASK_FILE} | grep -n -w "${TASK_ID}:" | cut -d ':' -f 1)

if [ -z ${LINE_NUMBER} ]
then
	echo "Task ${TASK_ID} is not found"
else
	NEW_WORD=": completed"
	OLD_WORD=": pending"

	sed -i "${LINE_NUMBER} s/${OLD_WORD}/${NEW_WORD}/g" ${TASK_FILE}
	echo "Task ${TASK_ID} marked as completed"
fi

sleep 5
clear
