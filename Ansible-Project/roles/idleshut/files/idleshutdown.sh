#!/bin/bash

#=================================================================#

# 2 hours in seconds
IDLE_THRESHOLD=7200

# CPU load threshold measured as a percentage for determining system activity
CPU_THRESHOLD=50

# Check every 15 seconds for activity
CHECK_INTERVAL=15

# Input device - mouse
MOUSE_DEV="/dev/input/mouse0"

#=================================================================#

# Tracks idle time
idle_timer=0

while true; do
        timeout "$CHECK_INTERVAL" dd if="$MOUSE_DEV" bs=24 count=1 status=none > /dev/null 2>&1
	idle_status=$?

	# Check CPU usage - 1 minute load avg
        cpu_load=$(awk '{print int($1 * 100)}' /proc/loadavg)

        # If there is no mouse activity and CPU load is below the threshold, increment the timer
        if [[ "$idle_status" -eq 124 && "$cpu_load" -lt "$CPU_THRESHOLD" ]]; then
                idle_timer=$((idle_timer + CHECK_INTERVAL))
        else
                idle_timer=0
        fi

	# If timer reaches threshold, shutdown
	if [[ "$idle_timer" -ge "$IDLE_THRESHOLD" ]]; then
		/sbin/shutdown -h now 
		exit 0
	fi

done
