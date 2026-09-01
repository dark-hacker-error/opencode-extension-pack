#!/bin/bash
# GitHub Search Script - Search for tools on GitHub
# Usage: ./github-search.sh <query>

if [ -z "$1" ]; then
    echo "Usage: $0 <query>"
    exit 1
fi

QUERY=$1
echo "[*] Searching GitHub for: $QUERY"
curl -s "https://api.github.com/search/repositories?q=$QUERY&sort=stars&order=desc&per_page=10" | python3 -c "
import sys, json
data = json.load(sys.stdin)
for item in data.get('items', []):
    print(f\"{item['full_name']} - {item['stargazers_count']} stars - {item['description']}\")
"