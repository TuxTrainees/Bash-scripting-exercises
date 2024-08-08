#!/usr/bin/env bash

if [ -f /etc/os-release ]
then
	. /etc/os-release
	DISTRO=$ID
else
	exit 2
fi

if [ $(-z "which dilog") ] | [ $(-z "which bc")]
then
	if [ "$DISTRO" = "arch" ] | [ "$DISTRO" ="manjaro"]
	then
		sudo pacman -Syyu
		sudo pacman -S dialog bc
	elif [ "$DISTRO" = "ubuntu" ] | [ "$DISTRO" = "debian" ] | [ "$DISTRO" = "linuxmint" ] | [ "$DISTRO" = "raspbian" ]
	then
		sudo apt update
		sudo apt install -y dialog bc
	elif [ "$DISTRO" = "fedora" ] | [ "$DISTRO" = "rhel" ] | [ "$DISTRO" = "centos" ]
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

touch tempfile.txt
dialog --inputbox "number1:" 8 40 2> tempfile.txt
NUMBER1=$(<tempfile.txt)
dialog --inputbox "operator:" 8 40 2> tempfile.txt
OPERATOR=$(<tempfile.txt)
dialog --inputbox "number2:" 8 40 2> tempfile.txt
NUMBER2=$(<tempfile.txt)

rm tempfile.txt

dialog --msgbox "result : $(echo "${NUMBER1} ${OPERATOR} ${NUMBER2}" | bc)" 8 40
clear
