#!/bin/bash

# Function to display horizontal line separator
print_separator() {
    printf "----------------------------------------\n"
}

# Main monitoring loop
echo "Real-Time System Monitoring"

while true; do
    clear
    print_separator
    echo "CPU Usage:"
    top -bn 1 | grep -E "^%?Cpu"
    print_separator
    echo "Memory Usage:"
    free -h | grep -E "^Mem:"
    print_separator
    echo "Network Usage:"
    ifconfig eth0 | grep -E "RX bytes|TX bytes"
    print_separator
    sleep 1
done

