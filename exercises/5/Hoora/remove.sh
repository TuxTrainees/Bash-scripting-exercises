#!/usr/bin/env bash

TASK_FILE=$1

clear
echo -e "\033[1m\t\tREMOVE A TASK\n\033[0m"

if [ ! -f ${TASK_FILE} ]
then
	echo "No Task Found"
	exit 1
fi

read -p "Enter Task ID To Remove: " TASK_ID

LINE_NUMBER=$(cat ${TASK_FILE} | grep -w "${TASK_ID}:" | cut -d ':' -f 1)

if [ -z LINE_NUMBER ]
then
	sed -i "${LINE_NUMBER}d" ${TASK_FILE}
	echo "Task ${TASK_ID} removed"
else
	echo "Task ${TASK_ID} is not found"
fi
