#!/bin/bash

# Configuration
update_interval=7  # Time interval in days for update reminders

# Function to display reminder
display_reminder() {
    local message="$1"
    notify-send "Update Reminder" "$message"
}

# Main reminder loop
echo "Update Reminder Script"

while true; do
    current_date=$(date +%F)
    last_update_date=$(stat -c %y /var/cache/apt/pkgcache.bin | cut -d ' ' -f1)
    
    if [ $(date -d "$last_update_date + $update_interval days" +%s) -le $(date -d "$current_date" +%s) ]; then
        reminder_message="It's time to update your system packages and software."
        display_reminder "$reminder_message"
    fi
    
    sleep 86400  # Sleep for 24 hours (1 day)
done

