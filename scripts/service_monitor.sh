#!/bin/bash
SERVICE=nginx 

if systemctl is sctive --quiet $SERVICE 
then
	echo "$SERVICE is runnning"
else
	echo "$SERVICE is down, restarting..."
	systemctl restart $SERVICE
fi
