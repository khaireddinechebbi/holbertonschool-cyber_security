#!/bin/bash
grep -iE "iptables -A INPUT" auth.log | wc -l
