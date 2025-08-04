#!/bin/bash

#VERSION: v1

#CONTEXT: first ever version (v0.5) only had "clear && ls'

# Function to convert 24-hour time to 12-hour format without seconds
convert_tim() {
    # Get current time in HH:MM:SS format
    full_time=$(date +"%T")

    # Extract hour and minute
    hour=$(echo "$full_time" | cut -d ':' -f 1)
    minute=$(echo "$full_time" | cut -d ':' -f 2)

    # Convert to 12-hour format
    if [ "$hour" -gt 12 ]; then
        hour=$((hour - 12))
    elif [ "$hour" -eq 0 ]; then
        hour=12
    fi

    echo "Time: $hour:$minute"
}

# Call the function and store the result
time=$(convert_tim)

# Output the final time
clear && ls
echo "$time"
