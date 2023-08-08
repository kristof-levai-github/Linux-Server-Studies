#!/bin/bash

# List of software packages to install
packages=("package1" "package2" "package3")

# Function to install packages with dependencies
install_packages() {
    local packages_to_install=()
    
    for package in "${packages[@]}"; do
        if ! dpkg -l | grep -q "^ii  $package "; then
            packages_to_install+=("$package")
        fi
    done
    
    if [ ${#packages_to_install[@]} -gt 0 ]; then
        echo "Installing packages: ${packages_to_install[*]}"
        sudo apt-get update
        sudo apt-get install -y "${packages_to_install[@]}"
    else
        echo "All packages are already installed."
    fi
}

# Main script
echo "Software Installation Script"

# Check for root/sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run with sudo."
    exit 1
fi

# Call the function to install packages
install_packages

