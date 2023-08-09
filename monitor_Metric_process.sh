#!/bin/bash

# Function to display system metrics (CPU, memory, disk space)
function view_system_metrics() {
    echo "---- System Metrics ----"
    cpu_usage=$(top -bn 1 | grep '%Cpu' | awk '{print $2}')
    mem_usage=$(free | grep Mem | awk '{printf("%.1f", $3/$2 * 100)}')
    disk_usage=$(df -h / | tail -1 | awk '{print $5}')
    
    echo "CPU Usage: $cpu_usage%   Memory Usage: $mem_usage%   Disk Space: $disk_usage"
}

# Function to monitor a specific service
function monitor_service() {
    echo "---- Monitor a Specific Service ----"
    read -p "Enter the name of the service to monitor: " service_name

    if systemctl is-active --quiet $service_name; then
        echo "$service_name is running."
    else
        echo "$service_name is not running."
        read -p "Do you want to start $service_name? (Y/N): " choice
        if [[ "$choice" =~ ^[Yy]$ ]]; then
            systemctl start $service_name
            echo "$service_name started successfully."
        fi
    fi
}

# Main loop for continuous monitoring
while true; do
    clear  # Clear the screen for a clean interface
    echo "---- Monitoring Metrics Script ----"
    echo "1. View System Metrics"
    echo "2. Monitor a Specific Service"
    echo "3. Exit"

    read -p "Enter your choice (1, 2, or 3): " choice

    case $choice in
        1)
            view_system_metrics
            ;;
        2)
            monitor_service
            ;;
        3)
            echo "Exiting the script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Error: Invalid option. Please choose a valid option (1, 2, or 3)."
            ;;
    esac

    # Sleep for a moment before displaying the menu again
    sleep 2
done
