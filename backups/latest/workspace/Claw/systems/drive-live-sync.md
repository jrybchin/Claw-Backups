# Drive Live Sync

## Purpose
Keep a small designated set of live/current Claw docs mirrored into Google Drive in a quiet backend process so Drive becomes a reliable human-facing progress layer.

## What this sync layer covers now
The initial mirrored live docs are:
- `Claw/logic/active-tasks-list.md` -> `Active Tasks List`
- `Claw/features/recovery-system/live-system-status-report.md` -> `Live System Status Report`

These are defined in:
- `Claw/systems/drive-live-sync-manifest.json`

## State and logs
- Last synced hashes/state: `Claw/systems/drive-live-sync-state.json`
- Run logs: `Claw/systems/logs/drive-live-sync/`

## Sync scripts
- Main sync script: `Claw/systems/scripts/sync_drive_live_docs.py`
- Shell wrapper: `Claw/systems/scripts/sync_drive_live_docs.sh`
- Cron installer: `Claw/systems/scripts/install_drive_live_sync_cron.sh`

## Behavior
The sync script:
- reads the manifest of designated live docs
- computes local content hashes
- compares them against the last synced state
- writes only changed docs to Drive
- logs the result of each run
- leaves unchanged docs alone

## Recommended usage
### Immediate/manual sync after meaningful updates
Run:
`/home/jrybc/.openclaw/workspace/Claw/systems/scripts/sync_drive_live_docs.sh`

### Dry run
Run:
`/home/jrybc/.openclaw/workspace/Claw/systems/scripts/sync_drive_live_docs.sh --dry-run`

### Install backup cron
Run:
`/home/jrybc/.openclaw/workspace/Claw/systems/scripts/install_drive_live_sync_cron.sh`

This installs a 15-minute backup sync cron entry.

## Why this exists
The goal is to make Google Drive feel like a passive, up-to-date tracking layer instead of a manually stale side mirror.

## Future expansion
Likely next mirrored docs:
- `Current Active Context` / `Channel Active Context`
- a Mission Control progress tracker
- other narrowly selected live docs if they prove useful for human progress tracking

## Operational rule
Keep this sync layer small and focused. Mirror the current-state docs that help humans track progress, not every doc in the whole system on every change.
