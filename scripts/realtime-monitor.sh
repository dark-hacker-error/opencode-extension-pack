#!/bin/bash
# Real-time Monitor Script
# Usage: bash realtime-monitor.sh <target>

if [ -z "$1" ]; then
    echo "Usage: bash realtime-monitor.sh <target>"
    exit 1
fi

echo "[*] Monitoring $1..."
echo "Press Ctrl+C to stop"