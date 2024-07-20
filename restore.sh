#!/bin/bash

# Load configuration
source ./config/backup.conf

# List available backups
echo "Available backups:"
ls $BACKUP_DIR/backup_*.tar.gz

# Prompt user for the backup to restore
read -p "Enter the timestamp of the backup to restore (e.g., 20210712_153045): " timestamp

# Restore the backup
tar -xzf $BACKUP_DIR/backup_${timestamp}.tar.gz -C /

# Log the restore
echo "Restore completed for backup_${timestamp}.tar.gz" >> ./logs/backup.log
