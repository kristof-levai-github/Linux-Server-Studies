#!/bin/bash

# Function to organize files by type
organize_files() {
    local source_directory="$1"
    
    for file in "$source_directory"/*; do
        if [ -f "$file" ]; then
            file_extension="${file##*.}"
            target_directory="$source_directory/$file_extension"
            
            # Create the target subdirectory if it doesn't exist
            mkdir -p "$target_directory"
            
            # Move the file to the appropriate subdirectory
            mv "$file" "$target_directory"
            
            echo "Moved: $(basename "$file") to $target_directory/"
        fi
    done
    
    echo "Files organized in subdirectories based on file type."
}

# Main script
echo "File Organizer"

read -p "Enter the source directory path: " source_directory

if [ ! -d "$source_directory" ]; then
    echo "Source directory does not exist."
    exit 1
fi

organize_files "$source_directory"

