# Codex Connection Setup

## Purpose
Document how Codex was connected to Claw documentation through a Windows mirror layer so the setup can be understood, repeated, and repaired later.

## Why This Was Needed
Claw’s main working docs live in the OpenClaw workspace under WSL/Linux.

Codex, however, was being used through the regular Microsoft Store Windows app.

That created a cross-filesystem problem:
- Claw docs existed in WSL
- Codex could not reliably see the live WSL Claw folder structure directly
- direct path access was inconsistent enough that a more reliable bridge was needed

## Solution Chosen
Use a **Windows mirror folder** for the most important Codex-facing Claw docs.

This allows:
- Claw to keep its main source-of-truth docs in the workspace
- Codex to read a curated Windows-accessible mirror
- continuity without requiring manual copy/paste every time

## Mirror Folder
The Windows mirror folder used is:
- `C:\Users\jrybc\Codex-Claw-Mirror`

## Mirror Structure
The mirror is intentionally curated and divided into:

### core
Used for central alignment and system understanding.

Examples:
- active tasks
- transplantable system logic
- human system explanation
- documentation rules
- memory and source handling rules

### recovery
Used for backup diagnosis, recovery, and fail-safe work.

Examples:
- live system status report
- crash prevention and fail-safe checklist
- backup lifeline workflow
- Codex recovery agent instructions

### reference
Used for high-value stable supporting context.

Examples:
- GOG feature overview
- GOG repair log

## Why a Curated Mirror Was Used
A full raw clone of the entire Claw folder was not chosen because Codex would benefit more from:
- a smaller set of high-value docs
- clearer read order
- less noise
- faster orientation

## Sync Script
A WSL-side sync script was created to copy selected docs into the Windows mirror.

The sync script path is:
- `/home/jrybc/.openclaw/workspace/Claw/systems/scripts/sync_codex_mirror.sh`

This script copies selected docs from the WSL OpenClaw workspace into the Windows mirror folder.

## Immediate Sync Logic
The system was updated so that high-value changes should trigger immediate Codex mirror syncs.

High-value changes include:
- Claw Plan updates
- dynamic logic updates
- live status updates
- recovery doc updates
- active task changes
- major continuity-relevant structure changes

## Scheduled Backup Sync
A Windows scheduled task was recommended to run the sync script periodically as a backup layer.

The command used for scheduled execution is:
- `wsl.exe bash -lc '/home/jrybc/.openclaw/workspace/Claw/systems/scripts/sync_codex_mirror.sh'`

The purpose of the scheduled task is to:
- keep the mirror fresh even if a manual or immediate sync is missed
- help account for changes made outside the normal agent workflow

## How Codex Was Tested
Codex was tested for:
- reading its own skill instructions
- reading Windows files
- reading the Windows Codex mirror
- limited WSL-share visibility

The final practical bridge was the Windows mirror, not direct dependence on WSL path access.

## Practical Result
Codex can now:
- read the Windows mirror reliably
- use the mirrored Claw docs as its recovery/context source
- operate as a meaningful backup recovery agent with much less manual copy/paste

## What To Replicate In The Future
If rebuilding this system later, repeat these steps:
1. create the Windows Codex mirror folder
2. define a curated mirror doc set
3. create the WSL sync script
4. run an initial sync
5. add immediate sync behavior for high-value changes
6. set up a scheduled backup sync on Windows
7. test Codex by reading the mirror files directly

## Notes
- The mirror is for Codex-facing continuity, not for replacing the main Claw source-of-truth docs.
- The main Claw source-of-truth remains the OpenClaw workspace docs.
- The mirror should evolve carefully as the system grows.

## Status
This setup is active and should be maintained as part of the broader recovery and continuity system.
