#!/bin/bash
# Password & Hash Tools
# Usage: bash password-tools.sh <command> <args>

show_help() {
    echo "Password & Hash Tools"
    echo "Commands:"
    echo "  generate <length>        - Generate random password"
    echo "  hash <text> <algorithm>  - Generate hash (md5/sha1/sha256/sha512)"
    echo "  salt <length>            - Generate random salt"
    echo "  strength <password>      - Check password strength"
}

case "$1" in
    generate) openssl rand -base64 $(( ${2:-16} * 3 / 4 )) | tr -d '/+=' | head -c ${2:-16} ;;
    hash) echo -n "$2" | ${3:-sha256}sum ;;
    salt) openssl rand -hex $(( ${2:-16} / 2 )) ;;
    *) show_help ;;
esac