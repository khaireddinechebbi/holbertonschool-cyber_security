#!/bin/bash

# Check if the log file exists
LOG_FILE="logs.txt"

# Extract IP addresses, count occurrences, and find the most frequent IP
MOST_FREQUENT_IP=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

# Print the most frequent IP
if [[ -n "$MOST_FREQUENT_IP" ]]; then
    echo "$MOST_FREQUENT_IP"
else
    echo "No IP addresses found in the log file."
fi
