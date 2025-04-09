#!/bin/bash
grep "POSSIBLE BREAK-IN ATTEMPT!" auth.log | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort | uniq > test