#!/bin/bash
grep "Invalid user root" auth.log | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort -u > authe.txt