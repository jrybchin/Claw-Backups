# Recovery Memory Mirror

## Purpose
Provide a compact memory mirror optimized for recovery, fallback agents, and restart reconstruction.

This file should help a recovery path answer:
- what changed recently
- what continuity systems exist now
- what recovery-safe state is known
- what still needs caution

## Current Recovery-Relevant State
- The system now has a real multi-agent roster with a dedicated `recovery-backup` agent.
- Shared coordination docs exist locally and should be treated as the recovery/handoff layer.
- A Drive live-sync layer exists for selected live/current docs, so Drive can act as a human-facing recovery/tracking surface.
- The GitHub backup system now preserves archival snapshots over time and includes timestamped MEMORY exports.
- Mission Control has a shared snapshot data model and exported payloads that can help reconstruct the visible command surface.

## Current Known-Good Continuity Layers
- `MEMORY.md`
- `memory/YYYY-MM-DD.md`
- `Claw/features/recovery-system/live-system-status-report.md`
- `Claw/logic/active-tasks-list.md`
- `Claw/logic/channel-active-context.md`
- `LIVE-STATE.md`
- `RECOVERY-BRIEF.md`
- `AGENT-REGISTRY.md`
- Drive mirrored current-state docs
- GitHub archival backups with timestamped MEMORY snapshots

## Current Recovery Cautions
- Compiled control-ui patching is useful but brittle.
- The deeper session/heartbeat problem should be treated as a backend/session-state issue until cleanly proven otherwise.
- Second-provider resilience is not complete yet.

## Recommended First Read Order During Recovery
1. `Claw/features/recovery-system/live-system-status-report.md`
2. `Claw/logic/priority-continuity-ledger.md`
3. `LIVE-STATE.md`
4. `RECOVERY-BRIEF.md`
5. `Claw/logic/active-tasks-list.md`
6. `Claw/logic/recent-implementation-log.md`

## Update Rule
Update this file when the recovery architecture, fallback ownership, backup structure, or continuity backbone materially changes.
