#!/usr/bin/env bash

. /etc/os-release
DISTRO=$ID

if [ $(-z "which dilog") ] || [ $(-z "which bc")]
then
	if [ "$DISTRO" = "arch" ] || [ "$DISTRO" ="manjaro" ]
	then
		sudo pacman -Syyu
		sudo pacman -Sy dialog bc
	elif [ "$DISTRO" = "ubuntu" ] || [ "$DISTRO" = "debian" ] || [ "$DISTRO" = "linuxmint" ] || [ "$DISTRO" = "raspbian" ]
	then
		sudo apt update
		sudo apt install -y dialog bc
	elif [ "$DISTRO" = "fedora" ] || [ "$DISTRO" = "rhel" ] || [ "$DISTRO" = "centos" ]
	then
		sudo dnf install -y dialog bc
	elif [ "$DISTRO" = "opensuse" ]
	then
		sudo zypper install -y dialog bc
	else
		echo "your distro is not found"
		exit 2
	fi
fi

TMP_FILE="/tmp/tempfile.txt"
touch $TMP_FILE

dialog --inputbox "number1:" 8 40 2> $TMP_FILE
NUMBER1=$(<$TMP_FILE)
dialog --inputbox "operator:" 8 40 2> $TMP_FILE
OPERATOR=$(<$TMP_FILE)
dialog --inputbox "number2:" 8 40 2> $TMP_FILE
NUMBER2=$(<$TMP_FILE)

dialog --msgbox "result : $(echo "${NUMBER1} ${OPERATOR} ${NUMBER2}" | bc)" 8 40
clear
