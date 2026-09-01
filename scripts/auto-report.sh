#!/bin/bash
# Auto Report Script - Generate security reports
# Usage: ./auto-report.sh <target>

if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

TARGET=$1
OUTPUT="/root/recon/$TARGET"
REPORT="$OUTPUT/report.md"

echo "# Security Report: $TARGET" > $REPORT
echo "" >> $REPORT
echo "Generated: $(date)" >> $REPORT
echo "" >> $REPORT
echo "## Port Scan Results" >> $REPORT
if [ -f "$OUTPUT/nmap.txt" ]; then
    cat $OUTPUT/nmap.txt >> $REPORT
else
    echo "No port scan results found." >> $REPORT
fi

echo "" >> $REPORT
echo "## Web Technology" >> $REPORT
if [ -f "$OUTPUT/whatweb.txt" ]; then
    cat $OUTPUT/whatweb.txt >> $REPORT
else
    echo "No web technology results found." >> $REPORT
fi

echo "[+] Report generated: $REPORT"