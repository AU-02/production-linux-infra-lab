#!/bin/bash
echo "Checking system health..." 
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
DISK=$(df / | awk 'END{print $5}' | sed 's/%//')

echo "CPU usage: $CPU%"
echo "Memory usage: $MEM%"
echo "Disk usage: $DISK%"
