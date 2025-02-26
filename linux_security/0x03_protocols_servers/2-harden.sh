#!/bin/bash
find / -xdev -type d -perm -002 ! -path "/proc/*" 2>/dev/null | tee /dev/tty | xargs chmod o-w