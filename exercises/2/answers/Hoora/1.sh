#!/usr/bin/env bash

PATH=$1
PATH_BACKUP="/home/hoora/Desktop/backup"

if [ ! -d "$PATH" ]
then
	echo "${PATH} is not exist"
	exit 2	
fi

GZ_FILENAME="$(basename ${PATH})-$(date +"%Y%m%d").tar.gz"
tar -czf ${GZ_FILENAME} ${PATH}

mkdir -p PATH_BACKUP 2> /dev/null
mv ${GZ_FILENAME} PATH_BACKUP

