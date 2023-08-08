#!/bin/bash

#How to use:

# uncomment the source_directory and backup_directory and add your paths to use
# To schedule the backup, you can use the cron scheduler. Open your crontab by running crontab -e and add a line like this to schedule the backup to run, for example, daily at midnight:
# 0 0 * * * /path/to/your/script.sh


# Configuration

#source_directory="/path/to/source"
#backup_directory="/path/to/backup"
backup_filename="backup_$(date +'%Y%m%d_%H%M%S').tar.gz"

# Function to display horizontal line separator
print_separator() {
    printf "------------------------\n"
}

# Function to perform backup
perform_backup() {
    echo "Performing backup..."
    tar -czf "$backup_directory/$backup_filename" "$source_directory"
    echo "Backup completed: $backup_directory/$backup_filename"
}

# Main script
echo "Backup Script"
print_separator

# Check if source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Source directory does not exist."
    exit 1
fi

# Check if backup directory exists, create if not
if [ ! -d "$backup_directory" ]; then
    echo "Backup directory does not exist. Creating..."
    mkdir -p "$backup_directory"
fi

# Perform the backup
perform_backup

print_separator
echo "Backup script completed."

# End of script
