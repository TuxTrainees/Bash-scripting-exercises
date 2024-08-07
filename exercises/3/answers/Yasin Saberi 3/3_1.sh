#!/bin/bash

dialog --msgbox "Welcome to Yasin-Calculator!" 8 40

NUM1=$(dialog --inputbox "Enter your first number: " 8 40 2>&1 >/dev/tty)
NUM2=$(dialog --inputbox "Enter your second number: " 8 40 2>&1 >/dev/tty)
OPERATOR=$(dialog --inputbox "Enter your operator (+, -, *, /): " 8 40 2>&1 >/dev/tty)

case $OPERATOR in
    '+') RESULT=$(echo "$NUM1 + $NUM2" | bc) ;;
    '-') RESULT=$(echo "$NUM1 - $NUM2" | bc) ;;
    '*') RESULT=$(echo "$NUM1 * $NUM2" | bc) ;;
    '/') RESULT=$(echo "scale=2; $NUM1 / $NUM2" | bc) ;;
    *) dialog --msgbox "Invalid operator" 7 40; exit 1 ;;
esac

dialog --msgbox "Result: $RESULT" 7 40
