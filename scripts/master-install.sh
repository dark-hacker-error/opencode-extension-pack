#!/bin/bash
# Master Install Script
# Usage: bash master-install.sh

echo "[*] Master installer"
echo "[*] Installing dependencies..."
pip install requests beautifulsoup4 2>/dev/null
echo "[*] Installation complete"