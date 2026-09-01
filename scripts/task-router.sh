#!/bin/bash
# Task Router Script
# Usage: bash task-router.sh <task> <target>

if [ -z "$1" ]; then
    echo "Usage: bash task-router.sh <task> <target>"
    exit 1
fi

TASK=$1
TARGET=$2

case $TASK in
    recon) bash scripts/auto-recon.sh $TARGET ;;
    exploit) bash scripts/auto-exploit.sh $TARGET ;;
    report) bash scripts/auto-report.sh $TARGET ;;
    *) echo "Unknown task: $TASK" ;;
esac