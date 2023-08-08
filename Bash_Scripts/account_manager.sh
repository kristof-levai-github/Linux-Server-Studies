#!/bin/bash

# Function to display horizontal line separator
print_separator() {
    echo "----------------------------------------\n"
}

# Function to create a new user account
create_user() {
    read -p "Enter the username: " username
    sudo useradd "$username"
    echo "User $username created."
}

# Function to modify an existing user account
modify_user() {
    read -p "Enter the username to modify: " username
    read -p "Enter the new username (leave empty to keep same): " new_username
    read -p "Enter the new home directory (leave empty to keep same): " new_home
    
    if [ -n "$new_username" ]; then
        sudo usermod -l "$new_username" "$username"
    fi
    
    if [ -n "$new_home" ]; then
        sudo usermod -d "$new_home" "$username"
    fi
    
    echo "User $username modified."
}

# Function to delete an existing user account
delete_user() {
    read -p "Enter the username to delete: " username
    sudo userdel -r "$username"
    echo "User $username deleted."
}

# Main script
echo "User Account Management Script"

while true; do
    echo "Choose an option:"
    echo "1. Create User"
    echo "2. Modify User"
    echo "3. Delete User"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            create_user
            ;;
        2)
            modify_user
            ;;
        3)
            delete_user
            ;;
        4)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please choose again."
            ;;
    esac

    print_separator
done
