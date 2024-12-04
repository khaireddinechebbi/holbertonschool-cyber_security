#!/bin/bash
if [ "$(sha256sum -c "$1" | cut -d ' ' -f 1)" = "$2" ] then echo "OK" 