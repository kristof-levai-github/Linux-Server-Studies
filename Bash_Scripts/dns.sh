#!/bin/bash

# Configuration
dns_server="dns.example.com"  # DNS server hostname or IP
dns_zone="example.com"        # DNS zone name
dns_keyfile="/path/to/keyfile.key"  # Path to TSIG key file

# Function to add a DNS record
add_dns_record() {
    read -p "Enter the record name (e.g., www): " record_name
    read -p "Enter the record type (e.g., A, CNAME, MX, etc.): " record_type
    read -p "Enter the record value: " record_value

    nsupdate -k "$dns_keyfile" << EOF
server $dns_server
zone $dns_zone
update add $record_name.$dns_zone 86400 $record_type $record_value
send
EOF
}

# Function to delete a DNS record
delete_dns_record() {
    read -p "Enter the record name to delete: " record_name
    read -p "Enter the record type: " record_type

    nsupdate -k "$dns_keyfile" << EOF
server $dns_server
zone $dns_zone
update delete $record_name.$dns_zone $record_type
send
EOF
}

# Main script
echo "DNS Record Management Script"

while true; do
    echo "Choose an option:"
    echo "1. Add DNS Record"
    echo "2. Delete DNS Record"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            add_dns_record
            ;;
        2)
            delete_dns_record
            ;;
        3)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please choose again."
            ;;
    esac

    echo "DNS record operation completed."
done
