#!/bin/bash

# Load configuration
source ./config/backup.conf

# Create the backup directory if it does not exist
mkdir -p $BACKUP_DIR

# Create a timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Backup directories and files
for item in "${BACKUP_ITEMS[@]}"; do
    if [ -e "$item" ]; then
        tar -czf "$BACKUP_DIR/backup_${timestamp}.tar.gz" "$item" 2>> ./logs/backup.log
        if [ $? -eq 0 ]; then
            echo "Successfully backed up $item at $timestamp" >> ./logs/backup.log
        else
            echo "Error backing up $item at $timestamp" >> ./logs/backup.log
        fi
    else
        echo "$item does not exist, skipping" >> ./logs/backup.log
    fi
done

# Log the completion of the backup process
echo "Backup completed at $timestamp" >> ./logs/backup.log
