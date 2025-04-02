#!/bin/bash

# Check if log file exists
LOG_FILE="logs.txt"

# Extract endpoints (URLs), count occurrences, and find the most requested one
MOST_REQUESTED_ENDPOINT=$(awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

echo "$MOST_REQUESTED_ENDPOINT"
