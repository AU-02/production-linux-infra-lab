#!/bin/bash
SERVICE=nginx 

if systemctl is sctive --quiet $SERVICE 
then
	echo "$SERVICE is runnning"
else
	echo "$SERVICE is down, restarting..."
	systemctl restart $SERVICE
fi

LOG = logs/incidents.log

if systemctl is-active --quite $SERVICE
then
	echo "$(date) $SERVICE running" >>$LOG
else
	echo "$(date) ALERT: $SERVICE down" >> $LOG
	systemctl restart $SERVICE 
	echo "$(date) ACTION: restarted $SERVICE" >> $LOG
fi
