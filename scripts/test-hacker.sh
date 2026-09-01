#!/bin/bash
# Test Hacker Script - Test system configuration

echo "[*] Testing system configuration..."
echo ""

# Check tools
echo "[+] Checking tools..."
for tool in nmap sqlmap hydra john hashcat nikto whatweb masscan; do
    if command -v $tool &> /dev/null; then
        echo "  [OK] $tool"
    else
        echo "  [MISSING] $tool"
    fi
done

echo ""
echo "[+] Checking wordlists..."
if [ -f "/root/wordlists/common.txt" ]; then
    echo "  [OK] common.txt"
else
    echo "  [MISSING] common.txt"
fi

echo ""
echo "[+] System test complete"