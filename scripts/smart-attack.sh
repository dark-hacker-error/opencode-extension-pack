#!/bin/bash
# Smart Attack Script
# Usage: bash smart-attack.sh <target>

if [ -z "$1" ]; then
    echo "Usage: bash smart-attack.sh <target>"
    exit 1
fi

TARGET=$1

echo "[*] Smart attack on: $TARGET"
echo "[*] Phase 1: Reconnaissance"
nmap -sV $TARGET

echo "[*] Phase 2: Vulnerability scanning"
nikto -h $TARGET

echo "[*] Smart attack complete!"