#!/bin/bash

SERVICE="docker"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_FILE="logs/incident_log.md"
AUDIT_DIR="git-audit"
STATUS=$(systemctl is-active $SERVICE)

if [ "$STATUS" != "active" ]; then
    echo "[$TIMESTAMP] ❌ $SERVICE is down. Attempting recovery..."
    systemctl restart $SERVICE
    NEW_STATUS=$(systemctl is-active $SERVICE)

    echo "- $TIMESTAMP: Detected $SERVICE failure." >> $LOG_FILE
    echo "  - Recovery attempt: $NEW_STATUS" >> $LOG_FILE

    # Save service status to git-tracked file
    mkdir -p "$AUDIT_DIR"
    systemctl status $SERVICE > "$AUDIT_DIR/${SERVICE}_status_$(date '+%Y%m%d_%H%M%S').log"

    git add logs/ $AUDIT_DIR/
    git commit -m "[$TIMESTAMP] Auto-healed $SERVICE: $STATUS → $NEW_STATUS"
fi

