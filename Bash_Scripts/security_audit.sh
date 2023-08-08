#!/bin/bash

# Function to display horizontal line separator
print_separator() {
    echo "----------------------------------------\n"
}

# Function to audit user permissions
audit_user_permissions() {
    echo "Auditing User Permissions:"
    print_separator

    echo "1. Check for unauthorized sudo access:"
    sudo grep -E '^sudo|^%sudo' /etc/group

    echo "2. List users with home directories world-readable:"
    find /home -type d -perm /o+r -ls 2>/dev/null

    print_separator
}

# Function to audit firewall rules
audit_firewall_rules() {
    echo "Auditing Firewall Rules:"
    print_separator

    echo "1. List iptables rules:"
    sudo iptables -L

    echo "2. List open ports:"
    sudo netstat -tuln

    print_separator
}

# Function to provide recommendations
provide_recommendations() {
    echo "Recommendations:"
    print_separator

    echo "1. Review and restrict sudo access to authorized users."
    echo "2. Ensure home directories have appropriate permissions."
    echo "3. Regularly update and patch the system software."
    echo "4. Use a firewall to filter and control network traffic."
    echo "5. Consider using an intrusion detection system (IDS)."
    
    print_separator
}

# Main script
echo "System Security Audit and Recommendations"

# Check for root/sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run with sudo."
    exit 1
fi

# Call functions to audit and provide recommendations
audit_user_permissions
audit_firewall_rules
provide_recommendations

