#!/bin/bash

# Part 1: File and Directory Exploration
echo "Welcome to the Interactive File and Directory Explorer!"

# Display files and directories in the current path using ls command with human-readable sizes
ls -lh

# Loop to repeatedly prompt the user for input
while true; do
    # Part 2: Character Counting
    # Prompt the user to enter a line of text
    echo -n "Enter a line of text (Press Enter without text to exit): "
    read user_input

    # Check if the user has entered an empty string (i.e., pressed Enter without any text)
    if [[ -z $user_input ]]; then
        echo "Exiting the Interactive Explorer. Goodbye!"
        exit 0
    fi

    # Calculate the character count for the user's input and display it
    char_count=${#user_input}
    echo "Character Count: $char_count"
done
