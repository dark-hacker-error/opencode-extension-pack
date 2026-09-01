#!/bin/bash
# Monster Attack Script - Full MITRE ATT&CK Coverage
# Usage: ./monster-attack.sh <target>

if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

TARGET=$1
OUTPUT="/root/recon/$TARGET"
mkdir -p $OUTPUT

echo "=========================================="
echo "    MONSTER ATTACK INITIATED"
echo "    Target: $TARGET"
echo "=========================================="

# Phase 1: OBSERVE (Reconnaissance)
echo ""
echo "PHASE 1: OBSERVE"
echo "----------------"

echo "[*] 1.1 Port Scanning..."
nmap -sV -sC -O -p- --min-rate=1000 -oN $OUTPUT/nmap-full.txt $TARGET 2>/dev/null
echo "  Port scan complete"

echo "[*] 1.2 Service Enumeration..."
nmap -sV -sC -O -oN $OUTPUT/nmap-services.txt $TARGET 2>/dev/null
echo "  Service enumeration complete"

echo "[*] 1.3 Web Technology Detection..."
whatweb $TARGET > $OUTPUT/whatweb.txt 2>/dev/null
echo "  Web tech detection complete"

echo "[*] 1.4 DNS Enumeration..."
dnsenum $TARGET > $OUTPUT/dnsenum.txt 2>/dev/null
echo "  DNS enumeration complete"

echo "[*] 1.5 Subdomain Enumeration..."
sublist3r -d $TARGET -o $OUTPUT/subdomains.txt 2>/dev/null
echo "  Subdomain enumeration complete"