#!/bin/bash
nmap -sV -sC -A --script banner,ssl-enum-ciphers,smb-enum-domains -oN service_enumeration_results.txt