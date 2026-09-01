#!/bin/bash
# Auto Cleanup Script
# Usage: bash auto-cleanup.sh

echo "[*] Auto cleanup started"
rm -f /tmp/*.pyc 2>/dev/null
rm -rf /tmp/__pycache__ 2>/dev/null
echo "[*] Cleanup complete"