#!/usr/bin/env bash

TASK_FILE=$1

clear
echo -e "\033[1m\t\tADD TASK\n\033[0m"

read -p "Task Description: " DESCRIPTION
read -p "Due Date(YYYY-MM-DD): " DUE_DATE

if [ -f ${TASK_FILE} ]
then
	TASK_ID=$(($(tail -n 1 ${TASK_FILE} | cut -d ':' -f 1)+1))
else
	touch ${TASK_FILE}
	TASK_ID=1
fi

echo "${TASK_ID}: ${DESCRIPTION}: ${DUE_DATE}: pending" >> "$TASK_FILE"

echo -e "\n\tThis task added successfully"
echo -e "Task ID: ${TASK_ID}\nDescription: ${DESCRIPTION}\nDue date: ${DUE_DATE}\nStatus: Pending"

sleep 5
clear
