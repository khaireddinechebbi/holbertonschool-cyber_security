#!/bin/bash
john --wordlist=/usr/share/wordlists/rockyou.txt --format=raw-md5 "$1" && john --show --format=Raw-MD5 "$1" > 4-password.txt
