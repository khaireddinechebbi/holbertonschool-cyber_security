#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt --format=NT "$1" && john --show --format=NT "$1" > 5-password.txt
