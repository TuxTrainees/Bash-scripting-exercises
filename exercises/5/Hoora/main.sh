#!/usr/bin/env bash

print_menu()
{
	echo -e "\033[1m\t\tTASK MANAGER\n\033[0m"
	echo "1. Add Task"
	echo "2. List Tasks"
	echo "3. Mark Task As Complete"
	echo "4. Remove Task"
	echo -e "5. Exit\n"
}

TASK_FILE="$HOME/task.txt"

clear

while true
do
	print_menu
	read -p "choose an option: " OPTION

	case ${OPTION} in
		1) source add.sh ${TASK_FILE} ;;
		2) source list.sh ${TASK_FILE} ;;
		3) source modify.sh ${TASK_FILE} ;;
		4) source remove.sh ${TASK_FILE} ;;
		5) clear; exit 0 ;;
	esac

done
