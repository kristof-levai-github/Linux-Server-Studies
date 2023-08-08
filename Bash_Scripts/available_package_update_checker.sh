#!/bin/bash

# Function to display desktop notification
send_alert() {
    local message="$1"
    notify-send "Package Update Alert" "$message"
}

# Main update check and notification
echo "Package Update Check and Notification"

# Check for root/sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run with sudo."
    exit 1
fi

# Update package repositories
echo "Updating package repositories..."
sudo apt-get update

# Check for available updates
updates_available=$(apt-get -s upgrade | grep -P '^\d+ upgraded' | awk '{print $1}')

if [ "$updates_available" -gt 0 ]; then
    echo "$updates_available updates available. Sending alert..."
    message="There are $updates_available package updates available. Run 'sudo apt-get upgrade' to update."
    send_alert "$message"
else
    echo "No updates available."
fi

