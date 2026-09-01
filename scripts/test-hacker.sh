#!/bin/bash
# Test Hacker Script
# Usage: bash test-hacker.sh

echo "[*] Testing hacker skill setup..."
echo "[*] Checking tools..."

which nmap && echo "  [+] nmap installed" || echo "  [-] nmap not found"
which sqlmap && echo "  [+] sqlmap installed" || echo "  [-] sqlmap not found"
which nikto && echo "  [+] nikto installed" || echo "  [-] nikto not found"

echo "[*] Test complete!"