#!/usr/bin/env bash

TMP_FILE="inputFile.txt"

while true;do
	dialog --inputbox "Enter first number" 8 40 2>"$TMP_FILE"
	read number1 < "$TMP_FILE"   
	if expr "$number1" + 1 2>/dev/null; then
      		break
   	fi
   	echo "$number1 is not a number!"
done
while true;do
	dialog --inputbox "Enter secend number" 8 40 2>"$TMP_FILE"
	read number2 < "$TMP_FILE"
	if expr "$number2" + 1 2>/dev/null; then
      		break
   	fi
  	echo "$number2 is not a number!"
done

dialog --menu "choose an operator" 15 40 4 \
   1 "+" \
   2 "-" \
   3 "*" \
   4 "/" \
   2>"$TMP_FILE"
read operator < "$TMP_FILE"
echo "$operator"

if [ $operator -eq 1 ]
then 
	result=$(echo "${number1}+${number2}" | bc)
	dialog --msgbox "$number1 + $number2 = $result" 8 40
elif [ $operator -eq 2 ]
then
	result=$(echo "${number1}-${number2}" | bc)
	dialog --msgbox "$number1 - $number2 = $result" 8 40
elif [ $operator -eq 3 ]
then   
	result=$(echo "${number1}*${number2}" | bc)
	dialog --msgbox "$number1 * $number2 = $result" 8 40
elif [ $operator -eq 4 ]
then
	result=$(echo "${number1}/${number2}" | bc)
	dialog --msgbox "$number1 / $number2 = $result" 8 40
fi

exit  0
