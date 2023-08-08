#!/bin/bash

# Function to display horizontal line separator
print_separator() {
    printf "%-40s\n" "----------------------------------------"
}

# Display system information
echo "System Information"
print_separator

# Display CPU information
echo "CPU Info:"
lscpu | grep -E "Model name|Architecture"
print_separator

# Display memory information
echo "Memory Info:"
free -h | grep "Mem:"
print_separator

# Display disk usage
echo "Disk Usage:"
df -h
print_separator

# Display network statistics
echo "Network Statistics:"
ifconfig -a | grep -E "eth|inet"
print_separator

