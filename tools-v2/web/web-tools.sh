#!/bin/bash
# Web Security Tools
# Usage: bash web-tools.sh <command> <args>

show_help() {
    echo "Web Security Tools"
    echo "Commands:"
    echo "  waf <url>                - Detect WAF"
    echo "  cms <url>                - Detect CMS"
    echo "  headers <url>            - Analyze HTTP headers"
    echo "  ssl <domain>             - SSL certificate check"
    echo "  default-creds <url>      - Check default credentials"
}

case "$1" in
    waf) curl -s -I "$2" | grep -i "cloudflare\|akamai\|incapsula\|mod_security" ;;
    cms) curl -s "$2" | grep -io "wordpress\|joomla\|drupal\|shopify" | head -1 ;;
    headers) curl -s -I "$2" ;;
    ssl) echo | openssl s_client -connect "$2:443" 2>/dev/null | openssl x509 -noout -dates -subject ;;
    *) show_help ;;
esac