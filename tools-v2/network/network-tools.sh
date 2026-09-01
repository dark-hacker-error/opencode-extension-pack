#!/bin/bash
# Network Tools
# Usage: bash network-tools.sh <command> <args>

show_help() {
    echo "Network Tools"
    echo "Commands:"
    echo "  quick-scan <target>      - Quick port scan"
    echo "  dns-enum <domain>        - DNS enumeration"
    echo "  whois-adv <domain>       - Advanced WHOIS"
    echo "  ping-sweep <network>     - Ping sweep network"
    echo "  arp-scan <network>       - ARP scan LAN"
    echo "  netmap <target>          - Network mapping"
}

case "$1" in
    quick-scan) nmap -Pn -T4 --top-ports 20 "$2" ;;
    dns-enum) dig "$2" ANY ;;
    whois-adv) whois "$2" ;;
    *) show_help ;;
esac