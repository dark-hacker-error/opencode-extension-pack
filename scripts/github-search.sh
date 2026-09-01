#!/bin/bash
# GitHub Tool Search
# Usage: bash github-search.sh <tool-name>

if [ -z "$1" ]; then
    echo "Usage: bash github-search.sh <tool-name>"
    exit 1
fi

echo "[*] Searching GitHub for: $1"
curl -s "https://api.github.com/search/repositories?q=$1&sort=stars&order=desc" | jq -r '.items[:5][] | "\(.full_name) - \(.description)\n\""