#!/bin/bash
grep -oP "rhost=\K\S+" auth.log | grep -P "^\d{1,3}(\.\d{1,3}){3}$" | sort | uniq | wc -l
