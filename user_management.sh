#!/bin/bash

# Function to display usage information and available options
usage() {
  echo "Usage: $0 [OPTION]..."
  echo "Options:"
  echo "  -c, --create   Create a new user account."
  echo "  -d, --delete   Delete an existing user account."
  echo "  -r, --reset    Reset the password of an existing user account."
  echo "  -l, --list     List all user accounts on the system."
  echo "  -h, --help     Display this help message."
}

# Function to check if a username exists
username_exists() {
  local username="$1"
  id "$username" &>/dev/null
}

# Function to create a new user account
create_user_account() {
  read -p "Enter the new username: " new_username

  # Check if the username already exists
  if username_exists "$new_username"; then
    echo "Error: Username already exists. Please choose a different username."
    exit 1
  fi

  # Prompt for the new password
  read -s -p "Enter the password for the new user: " new_password
  echo

  # Create the user with the provided password
  sudo useradd -m "$new_username" # -m to create home directory
  echo "$new_username:$new_password" | sudo chpasswd

  echo "User account '$new_username' created successfully."
}

# Function to delete an existing user account
delete_user_account() {
  read -p "Enter the username to delete: " delete_username

  # Check if the username exists
  if ! username_exists "$delete_username"; then
    echo "Error: Username does not exist."
    exit 1
  fi

  # Delete the user and their home directory
  sudo userdel -r "$delete_username"

  echo "User account '$delete_username' deleted successfully."
}

# Function to reset the password of an existing user account
reset_password() {
  read -p "Enter the username to reset password: " reset_username

  # Check if the username exists
  if ! username_exists "$reset_username"; then
    echo "Error: Username does not exist."
    exit 1
  fi

  # Prompt for the new password
  read -s -p "Enter the new password: " new_password
  echo

  # Reset the password
  echo "$reset_username:$new_password" | sudo chpasswd

  echo "Password for user '$reset_username' reset successfully."
}

# Function to list all user accounts on the system
list_user_accounts() {
  echo "List of User Accounts:"
  cut -d: -f1,3 /etc/passwd
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
  case "$1" in
    -c|--create)
      create_user_account
      ;;
    -d|--delete)
      delete_user_account
      ;;
    -r|--reset)
      reset_password
      ;;
    -l|--list)
      list_user_accounts
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Error: Invalid option '$1'"
      usage
      exit 1
      ;;
  esac
  shift
done

# If no options are provided, display usage information
if [[ $# -eq 0 ]]; then
  usage
fi
