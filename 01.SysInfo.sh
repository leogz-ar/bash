#!/bin/bash

echo "===== SYSTEM INFORMATION ====="
echo "Hostname: $(hostname)"
echo "Operating System: $(lsb_release -d | cut -f2)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo

echo "===== CPU INFORMATION ====="
lscpu | grep -iE '^nombre del modelo|^arquitectura|^cpu\(s\):'
echo

echo "===== MEMORY ====="
free -h
echo

echo "===== DISK USAGE ====="
df -h | grep '^/dev'
echo

echo "===== NETWORK ====="
ip a | grep inet
