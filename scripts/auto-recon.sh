#!/bin/bash
# Auto Recon Script - Automated Reconnaissance
# Usage: ./auto-recon.sh <target>

if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

TARGET=$1
OUTPUT="/root/recon/$TARGET"
mkdir -p $OUTPUT

echo "[*] Starting auto-recon on $TARGET"

# Port scan
echo "[*] Running nmap..."
nmap -sV -sC -O -oN $OUTPUT/nmap.txt $TARGET 2>/dev/null

# Web detection
echo "[*] Running whatweb..."
whatweb $TARGET > $OUTPUT/whatweb.txt 2>/dev/null

# Directory brute
echo "[*] Running dirb..."
dirb http://$TARGET > $OUTPUT/dirb.txt 2>/dev/null

echo "[+] Recon complete. Results in $OUTPUT"