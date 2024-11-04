#!/bin/bash
current_time=$(date +%s)
timestamp_file="$HOME/.last_ip_check_time"
status_file="$HOME/.last_ip_check_status"
interval=600  # 10 minutes in seconds

# Check if the timestamp file exists and read the value; initialize to 0 if not found
if [ -f "$timestamp_file" ]; then
    last_check_time=$(cat "$timestamp_file")
else
    last_check_time=0
fi

# Calculate the time difference
time_diff=$((current_time - last_check_time))

if [ "$time_diff" -ge "$interval" ]; then
    # Time to check the internet status again
    output=$(curl -s --max-time 2 ifconfig.me)
    if [[ $output =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "🌐" > "$status_file"  # Internet access
    else
        echo "🚫" > "$status_file"  # No internet access or timeout
    fi
    # Update the last check time
    echo "$current_time" > "$timestamp_file"
fi

# Output the last known status
cat "$status_file"
