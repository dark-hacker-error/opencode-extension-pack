#!/bin/bash
# Monster Attack Script
# Usage: bash monster-attack.sh <target>

if [ -z "$1" ]; then
    echo "Usage: bash monster-attack.sh <target>"
    exit 1
fi

echo "[*] Monster attack on: $1"
echo "[*] Phase 1: Reconnaissance"
echo "[*] Phase 2: Scanning"
echo "[*] Phase 3: Exploitation"
echo "[*] Monster attack complete!"