#!/bin/bash
# GitHub Tool Installer
# Usage: bash github-install.sh <repo-url>

if [ -z "$1" ]; then
    echo "Usage: bash github-install.sh <repo-url>"
    exit 1
fi

REPO=$1
REPO_NAME=$(basename $REPO .git)

echo "[*] Cloning: $REPO"
git clone $REPO

echo "[*] Installing: $REPO_NAME"
cd $REPO_NAME
pip install -r requirements.txt 2>/dev/null || echo "No requirements.txt found"

echo "[*] Installation complete!"