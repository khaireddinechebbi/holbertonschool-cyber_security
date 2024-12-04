#!/bin/bash
grep "^NAME=" /etc/os-release | cut -d '"' -f 2