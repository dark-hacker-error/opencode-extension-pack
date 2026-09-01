#!/bin/bash
# Auto Reconnaissance Script
# Usage: bash auto-recon.sh <target>

if [ -z "$1" ]; then
    echo "Usage: bash auto-recon.sh <target>"
    exit 1
fi

TARGET=$1

echo "[*] Starting auto-recon on: $TARGET"
echo ""
echo "[*] Running nmap scan..."
nmap -sV -sC -O $TARGET

echo ""
echo "[*] Running whatweb..."
whatweb $TARGET

echo ""
echo "[*] Running nikto..."
nikto -h $TARGET

echo ""
echo "[*] Auto-recon complete!"