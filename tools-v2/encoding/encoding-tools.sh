#!/bin/bash
# Encoding/Decoding Tools
# Usage: bash encoding-tools.sh <command> <args>

show_help() {
    echo "Encoding/Decoding Tools"
    echo "Commands:"
    echo "  base64-encode <text>     - Encode to Base64"
    echo "  base64-decode <text>     - Decode from Base64"
    echo "  url-encode <text>        - URL encode"
    echo "  url-decode <text>        - URL decode"
    echo "  hex-encode <text>        - Encode to Hex"
    echo "  hex-decode <text>        - Decode from Hex"
    echo "  rot13 <text>             - ROT13 cipher"
    echo "  binary <text>            - Text to Binary"
    echo "  html-decode <text>       - HTML entity decode"
    echo "  all <text>               - All encodings"
}

case "$1" in
    base64-encode) echo -n "$2" | base64 ;;
    base64-decode) echo "$2" | base64 -d ;;
    url-encode) echo -n "$2" | python3 -c "import sys,urllib.parse; print(urllib.parse.quote(sys.stdin.read()))" ;;
    url-decode) echo -n "$2" | python3 -c "import sys,urllib.parse; print(urllib.parse.unquote(sys.stdin.read()))" ;;
    hex-encode) echo -n "$2" | xxd -p ;;
    hex-decode) echo "$2" | xxd -r -p ;;
    rot13) echo "$2" | tr 'A-Za-z' 'N-ZA-Mn-za-m' ;;
    *) show_help ;;
esac