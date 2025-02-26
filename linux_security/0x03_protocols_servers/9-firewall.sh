#!/bin/bash
iptables -F
iptables -P INPUT DROP && iptables -A INPUT -p tcp --dport 22 -j ACCEPT && iptables -A INPUT -i lo -j ACCEPT && iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT && iptables -P OUTPUT ACCEPT