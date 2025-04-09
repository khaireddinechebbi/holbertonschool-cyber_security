#!/bin/bash
grep -oP "new user: name=\K\S+" auth.log | sort -u | paste -sd ""