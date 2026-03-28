# Memory Backup & Update System

## Purpose
Define the working system for keeping Claw memory, current-state docs, Drive mirrors, and backup continuity layers updated after meaningful implementation work.

This exists because a feature being built is not enough; the memory and tracking system must also update in a way that survives resets, rate limits, handoffs, and environment splits.

## Core Principle
Whenever a meaningful feature, skill, system, repair, or coordination layer is implemented, the work is not complete until the relevant continuity and tracking layers are updated.

## Required Update Layers
### 1. Local durable memory
Write important implementation state into:
- `memory/YYYY-MM-DD.md`
- `MEMORY.md` when the lesson is durable and broad enough
- relevant `Claw/` system/logic/feature docs

### 2. Local live/current-state docs
Update the docs that explain the present state of the system, especially:
- `Claw/features/recovery-system/live-system-status-report.md`
- `Claw/logic/active-tasks-list.md`
- `Claw/logic/channel-active-context.md`
- `LIVE-STATE.md`
- `RECOVERY-BRIEF.md` when a recovery/handoff scenario is active

### 3. Drive mirror layer
Mirror the human-facing live/current docs into Drive so progress is externally visible without needing to reconstruct the whole story from local files.

### 4. Backup/recovery layer
Update any backup-agent, multi-agent, or recovery docs that would matter if the main path is interrupted.

## Priority Files That Should Be Updated Often
These should be treated as high-priority update targets when meaningful system work happens:
- `Claw Plan.md`
- `Claw/features/recovery-system/live-system-status-report.md`
- `Claw/logic/active-tasks-list.md`
- `Claw/logic/channel-active-context.md`
- `LIVE-STATE.md`
- `RECOVERY-BRIEF.md` (when a handoff/recovery case exists)
- `AGENT-REGISTRY.md` (when agent roles/models/routing change)
- `PROVIDER-AUTH-SETUP.md` (when provider status changes)

## Update Trigger Rule
Trigger updates when any of the following happen:
- a new feature/skill/system becomes real or materially changes
- a repair changes the known-good state
- a new continuity layer is added
- a new agent or fallback path is added
- a backup/recovery process changes
- a major implementation lane finishes
- a major implementation lane becomes the new active focus

## Working Sequence After Meaningful Implementation
1. Update the relevant local source-of-truth docs.
2. Update local live/current-state docs.
3. Write a durable session note into `memory/YYYY-MM-DD.md`.
4. Mirror the designated live/current docs into Drive.
5. Update backup/recovery/multi-agent docs if the change affects coordination.
6. Commit the changes in the workspace.

## Automation Support
The Drive live-sync system should handle selected current-state docs automatically.
This system should remain narrow and focused rather than trying to mirror every doc on every change.

The GitHub backup system should preserve archival history rather than only keeping a rolling latest snapshot. Each backup run should create a timestamped archive and include a timestamped MEMORY export so recovery can inspect memory state over time.

## Why This Exists
Without a dedicated memory backup/update system, the failure pattern is predictable:
- implementation work finishes
- the system behavior changes
- the docs and mirrors lag behind
- later sessions or backup agents act from stale state
- the user has to reconstruct context manually

## Relationship To Other Docs
This system should work together with:
- `Claw/systems/memory-persistence-fix.md`
- `Claw/systems/memory-and-source-handling-rules.md`
- `Claw/systems/memory-mirror-architecture.md`
- `Claw/systems/drive-live-sync.md`
- `Claw/features/recovery-system/live-system-status-report.md`
- `Claw/logic/priority-continuity-ledger.md`
- `Claw/logic/recent-implementation-log.md`
- `Claw/features/recovery-system/recovery-memory-mirror.md`
- `LIVE-STATE.md`
- `RECOVERY-BRIEF.md`

## Status
This document defines the working memory backup/update process and should be treated as part of the continuity backbone.
