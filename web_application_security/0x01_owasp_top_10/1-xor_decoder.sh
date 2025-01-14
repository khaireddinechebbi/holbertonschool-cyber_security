#!/bin/bash

function ord {
    printf %d "'$1"
}

# Extract the XOR-encrypted string (strip {xor} prefix if present)
input=$1
if [[ $input == "{xor}"* ]]; then
    input=${input:5}
fi

# Decode the Base64 string
e=$(echo "$input" | base64 --decode | sed 's/\x00//g')

# Process each character in the decoded string
seq 0 $((${#e} - 1)) | while read line; do
    char=$(( $(ord "${e:$line:1}") ^ $(ord '_') ))
    # Print each decoded character followed by a space
    printf "%b" $(printf '\\%03o' $char)
done
echo
