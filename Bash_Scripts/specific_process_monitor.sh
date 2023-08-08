#!/bin/bash

#How to use:
#Uncomment the first 2 lines and fill in with your information, then run the script 
#Consider running it as a background process with nohup or with &

# Configuration

#process_name="your_process_name"
#email_recipient="your.email@example.com"
check_interval=5  # Time interval in seconds to check the process

# Function to send notification
send_notification() {
    local subject="$1"
    local message="$2"
    echo "$message" | mail -s "$subject" "$email_recipient"
}

# Main monitoring loop
echo "Process Monitoring: $process_name"

while true; do
    if ! pgrep -x "$process_name" > /dev/null; then
        subject="Process Monitoring Alert"
        message="The process $process_name has stopped running."
        send_notification "$subject" "$message"
        echo "Process $process_name is not running. Notification sent."
    else
        echo "Process $process_name is running."
    fi

    sleep "$check_interval"
done


