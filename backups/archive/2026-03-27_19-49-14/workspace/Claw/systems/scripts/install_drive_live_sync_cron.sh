#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/jrybc/.openclaw/workspace"
SCRIPT="$ROOT/Claw/systems/scripts/sync_drive_live_docs.sh"
LOGDIR="$ROOT/Claw/systems/logs/drive-live-sync"
mkdir -p "$LOGDIR"

CRON_LINE="*/15 * * * * $SCRIPT >> $LOGDIR/cron.log 2>&1"

( crontab -l 2>/dev/null | grep -Fv "$SCRIPT"; echo "$CRON_LINE" ) | crontab -

echo "Installed drive live sync cron: $CRON_LINE"
