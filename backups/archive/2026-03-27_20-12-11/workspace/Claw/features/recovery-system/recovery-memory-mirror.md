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
- Mission Control still has a local app and shared snapshot data model, but the live OpenClaw bundle was rolled back away from the native Mission Control route after a black-screen failure.
- `Claw/features/recovery-system/openclaw-webui-debugging-rules.md` now holds the confirmed rules for this OpenClaw UI failure class.

## Current Known-Good Continuity Layers
- `MEMORY.md`
- `memory/YYYY-MM-DD.md`
- `Claw/features/recovery-system/live-system-status-report.md`
- `Claw/features/recovery-system/openclaw-webui-debugging-rules.md`
- `Claw/logic/active-tasks-list.md`
- `Claw/logic/channel-active-context.md`
- `LIVE-STATE.md`
- `RECOVERY-BRIEF.md`
- `AGENT-REGISTRY.md`
- Drive mirrored current-state docs
- GitHub archival backups with timestamped MEMORY snapshots

## Current Recovery Cautions
- Direct compiled control-ui feature patching should be treated as a recovery-only hot zone, not as the default implementation surface.
- Stale continuity notes may still describe the old native Mission Control route as live unless the active bundle is re-verified.
- The deeper session/heartbeat problem should be treated as a backend/session-state issue until cleanly proven otherwise.
- Second-provider resilience is not complete yet.

## Recommended First Read Order During Recovery
1. `Claw/features/recovery-system/live-system-status-report.md`
2. `Claw/logic/priority-continuity-ledger.md`
3. `Claw/features/recovery-system/openclaw-webui-debugging-rules.md` when OpenClaw UI or Mission Control is part of the failure
4. `LIVE-STATE.md`
5. `RECOVERY-BRIEF.md`
6. `Claw/logic/active-tasks-list.md`
7. `Claw/logic/recent-implementation-log.md`

## Update Rule
Update this file when the recovery architecture, fallback ownership, backup structure, or continuity backbone materially changes.
