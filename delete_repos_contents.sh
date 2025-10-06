#!/bin/bash

# Check if the 'repos' directory exists
if [ -d "repos" ]; then
    # If it exists, change into it
    cd repos
    
    # Remove all its contents (recursively and forcibly)
    # The '*' ensures it deletes contents, not the directory itself
    rm -rf *
else
    # Optional: Print a message if the directory doesn't exist
    echo "Directory 'repos' does not exist. Skipping cleanup."
fi
