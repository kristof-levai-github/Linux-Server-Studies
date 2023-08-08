#!/bin/bash

# Function to display horizontal line separator
print_separator() {
    printf "----------------------------------------\n"
}

# Function to list existing cron jobs
list_cron_jobs() {
    echo "Existing Cron Jobs:"
    print_separator
    crontab -l
    print_separator
}

# Function to add a new cron job
add_cron_job() {
    read -p "Enter the cron schedule (e.g., '* * * * *'): " cron_schedule
    read -p "Enter the command to run: " command

    (crontab -l; echo "$cron_schedule $command") | crontab -
    echo "Cron job added:"
    echo "$cron_schedule $command"
}

# Function to remove a cron job
remove_cron_job() {
    read -p "Enter the cron schedule of the job to remove (e.g., '* * * * *'): " cron_schedule
    crontab -l | grep -v "$cron_schedule" | crontab -
    echo "Cron job with schedule '$cron_schedule' removed."
}

# Main script
echo "Cron Job Management Script"

while true; do
    echo "Choose an option:"
    echo "1. List Cron Jobs"
    echo "2. Add Cron Job"
    echo "3. Remove Cron Job"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            list_cron_jobs
            ;;
        2)
            add_cron_job
            ;;
        3)
            remove_cron_job
            ;;
        4)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please choose again."
            ;;
    esac

    print_separator
done
