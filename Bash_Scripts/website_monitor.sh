#!/bin/bash

# List of websites to monitor
websites=("http://www.example1.com" "http://www.example2.com")

# Email configuration

#email_recipient="your.email@example.com"
#email_subject="Website Availability Alert"

# Function to send email notification
send_notification() {
    local message="$1"
    echo "$message" | mail -s "$email_subject" "$email_recipient"
}

# Main monitoring loop
echo "Website Availability Monitor"

while true; do
    for website in "${websites[@]}"; do
        if ! curl --silent --head --fail "$website" >/dev/null; then
            echo "Website $website is down. Sending notification..."
            message="The website $website is currently down."
            send_notification "$message"
        fi
    done
    
    sleep 300  # Adjust the sleep interval as needed (e.g., 5 minutes)
done

# End of script
