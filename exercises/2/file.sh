#!/bin/bash

read -p "Enter the directory path to back up: " INPUT

if [[ ! -d "$INPUT" ]]; then
  exit 2
fi


if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory '$SOURCE_DIR' does not exist."
    exit 2
fi

[ ! -d "$BACKUP_FOLDER" ] && mkdir "$BACKUP_FOLDER"

BACKUP_FOLDER="backup"
DIR_NAME=$(basename "$SOURCE_DIR")
CURRENT_TIME=$(date +%Y%m%d%H%M%S)
BACKUP_FILE="${DIR_NAME}_${CURRENT_TIME}.tar.gz"

tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$DIR_NAME"
mv "$BACKUP_FILE" "$BACKUP_FOLDER/"

echo "Backup of '$SOURCE_DIR' created and moved to '$BACKUP_FOLDER/$BACKUP_FILE'."

