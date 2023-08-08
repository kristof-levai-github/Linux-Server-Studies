#!/bin/bash

# Function to configure network settings
configure_network() {
    read -p "Enter new IP address: " ip_address
    read -p "Enter subnet mask: " subnet_mask
    read -p "Enter gateway: " gateway

    echo "Configuring network settings..."
    
    sudo ip addr add "$ip_address/$subnet_mask" dev eth0
    sudo ip route add default via "$gateway"
    
    echo "Network settings configured."
}

# Main script
echo "Network Configuration Script"

# Check for root/sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run with sudo."
    exit 1
fi

# Call the function to configure network
configure_network

