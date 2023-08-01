#!/bin/bash

# 📝  Task 1: Comments
# # This is a bash script that demonstrates basic bash scripting concepts.


# 💬  Task 2: Echo
# Using the echo command to print a message.
echo "Hello,My name is Sachin  this is my first bash script! 🎉 "


# 🎛️  Task 3: Variables
# Declaring and assigning values to variables.
name="Sachin"
age=20


# ➕  Task 4: Using Variables
# Taking two numbers as input and printing their sum using variables.
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is: $sum 🌟 "


# 📊  Task 5: Using Built-in Variables
# Utilizing three different built-in variables to display relevant information.
echo "Script name: $0 " # Name of the script itself
echo "Process ID: $$ "  # Process ID of the current shell
echo "Number of arguments: $# " # Number of arguments passed to the script

# 🗃️  Task 6: Wildcards
# Listing all files with a specific extension in the current directory.
extension=".txt"
echo "Files with '$extension' extension in the current directory:"
ls *$extension
