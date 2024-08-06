#!/usr/bin/env bash

user=$USER
read -s -p "password:" PASSWORD

if groups ${user} | grep -Eq 'sudo|wheel'
then
	echo $PASSWORD | sudo -S ls /root
fi
