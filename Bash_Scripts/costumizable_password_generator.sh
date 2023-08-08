#!/bin/bash

# Function to generate a random password

generate_password() {
    local length=$1
    local charset=$2
    local password=""
    
    for ((i=0; i<length; i++)); do
        random_index=$((RANDOM % ${#charset}))
        password+=${charset:$random_index:1}
    done
    
    echo "$password"
}

# Main script
echo "Random Password Generator"

# Read password length
read -p "Enter password length: " length

# Read password complexity level
echo "Select password complexity level:"
echo "1. Numeric"
echo "2. Alphanumeric (lowercase)"
echo "3. Alphanumeric (mixed case)"
#p = display prompt before reading input
read -p "Enter complexity level (1/2/3): " complexity

#you can extend the script with combining these with numbers or special characters
case $complexity in
    1)
        charset="0123456789"
        ;;
    2)
        charset="abcdefghijklmnopqrstuvwxyz0123456789"
        ;;
    3)
        charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Generate and display the password
password=$(generate_password "$length" "$charset")
echo "Generated Password: $password"
