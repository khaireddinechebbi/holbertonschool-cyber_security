#!/bin/bash
echo "$(awk '$1 = 54.145.34.34' logs.txt | sort | awk '{print $12}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')"