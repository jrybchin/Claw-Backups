#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/jrybc/.openclaw/workspace"
BACKUP_SCRIPT="$ROOT/Claw/systems/scripts/run_claw_backup.sh"
LIVE_SYNC_SCRIPT="$ROOT/Claw/systems/scripts/sync_drive_live_docs.sh"
LOGDIR="${HOME}/.openclaw-backup-work"
mkdir -p "$LOGDIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S %Z')] user sign-off backup trigger" >> "$LOGDIR/logoff-trigger.log"

# Make sure current-state docs are mirrored before backup snapshot if possible.
if [ -x "$LIVE_SYNC_SCRIPT" ]; then
  "$LIVE_SYNC_SCRIPT" >> "$LOGDIR/logoff-trigger.log" 2>&1 || true
fi

exec "$BACKUP_SCRIPT"
