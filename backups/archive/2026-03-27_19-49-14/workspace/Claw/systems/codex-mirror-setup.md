# Codex Mirror Setup

## What has already been done
- A Windows Codex mirror folder was created.
- A sync script was created and run successfully.
- A curated document selection was defined.
- Immediate sync after high-value changes has been added to the documentation/workflow logic.

## Mirror location
`C:\Users\jrybc\Codex-Claw-Mirror`

## What is in the mirror
### core
- active-tasks-list.md
- documentation-rules.md
- human-system-explanation.md
- memory-and-source-handling-rules.md
- transplantable-system-logic.md

### recovery
- backup-lifeline-codex-recovery.md
- codex-recovery-agent-instructions.md
- crash-prevention-failsafe-checklist.md
- live-system-status-report.md

### reference
- gog-feature-overview.md
- gog-setup-and-repair-log.md

### top level
- claw-full-sweep-prompt.md
- README.txt
- last_sync.txt

## Immediate sync behavior
The system should now trigger immediate mirror syncs after high-value changes such as:
- Claw Plan updates
- dynamic logic updates
- live status updates
- recovery doc updates
- active task changes
- major continuity-relevant structure changes

## Scheduled backup sync recommendation
Set up a scheduled task on Windows to run the sync script every 5 to 15 minutes as a backup layer.

## Sync command
From WSL / Ubuntu:
`/home/jrybc/.openclaw/workspace/Claw/systems/scripts/sync_codex_mirror.sh`

## Windows scheduled task idea
Use `wsl.exe` to call the script from Windows.

Example command:
`wsl.exe bash -lc '/home/jrybc/.openclaw/workspace/Claw/systems/scripts/sync_codex_mirror.sh'`

## What still requires user action
- Create the Windows scheduled task if you want automatic backup syncing.
- Test that Codex can read from `C:\Users\jrybc\Codex-Claw-Mirror` reliably.
- If needed, refine which docs should remain in or out of the mirror.

## Suggested test prompt for Codex
`Read C:\Users\jrybc\Codex-Claw-Mirror\core\transplantable-system-logic.md and summarize the main operating logic.`
