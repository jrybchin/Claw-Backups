#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/jrybc/.openclaw/workspace"
exec "$ROOT/Claw/systems/scripts/sync_drive_live_docs.py" "$@"
