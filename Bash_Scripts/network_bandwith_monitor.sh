#!/bin/bash

# Configuration
alert_threshold=5  # In megabits per second (Mbps)
#email_recipient="your.email@example.com"
#email_subject="Network Bandwidth Alert"

# Function to send email notification
send_notification() {
    local message="$1"
    echo "$message" | mail -s "$email_subject" "$email_recipient"
}

# Main monitoring loop
echo "Network Bandwidth Monitor"

while true; do
    bandwidth_info=$(iftop -t -s 1 2>&1 | grep "Total send rate:")

    current_bandwidth=$(echo "$bandwidth_info" | awk '{print $4}')
    if [ $(echo "$current_bandwidth > $alert_threshold" | bc) -eq 1 ]; then
        echo "Network bandwidth threshold reached. Sending alert..."
        message="Network bandwidth has exceeded the threshold. Current bandwidth: $current_bandwidth Mbps"
        send_notification "$message"
    fi

    sleep 60  # Adjust the sleep interval as needed (e.g., 1 minute)
done

