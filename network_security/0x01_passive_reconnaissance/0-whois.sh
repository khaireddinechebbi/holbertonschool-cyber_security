#!/bin/bash
whois "$1" | awk 'BEGIN { FS=": "; OFS="," } /Registrant/ {print $1, $2 > "'$1'.csv"} /Admin/ {print $1, $2 > "'$1'.csv"} /Tech/ {print $1, $2 > "'$1'.csv"}'