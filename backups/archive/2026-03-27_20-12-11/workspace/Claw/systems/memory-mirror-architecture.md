# Memory Mirror Architecture

## Purpose
Define a layered memory/mirror system that improves recall, continuity, recovery, and coordination without creating unnecessary duplication or slowing reconstruction.

## Design Goal
Approximate very strong recall and continuity by using layered mirrors with clear role separation.

The target is not infinite memory.
The target is:
- high-signal recall
- fast reconstruction
- low-noise durability
- good multi-agent coordination
- clean handoff between local docs, live state, Drive, backups, and Mission Control

## Existing Layers
### 1. Long-term memory
- `MEMORY.md`
- role: durable lessons, preferences, major recurring structures, important lasting context

### 2. Daily raw continuity
- `memory/YYYY-MM-DD.md`
- role: day-level logs, chronological notes, rawer continuity stream

### 3. Live/current-state docs
- `Claw/features/recovery-system/live-system-status-report.md`
- `Claw/logic/active-tasks-list.md`
- `Claw/logic/channel-active-context.md`
- `LIVE-STATE.md`
- `RECOVERY-BRIEF.md`
- role: current working state, current ownership, current blockers, current next steps

### 4. Mirror/reference layer
- Drive mirrored live/current docs
- role: human-facing progress/reference surface

### 5. Backup/archive layer
- GitHub archival backups
- timestamped MEMORY snapshots
- role: recovery and historical reconstruction

## New Mirror Layers Added
### 6. Priority continuity mirror
- `Claw/logic/priority-continuity-ledger.md`
- role: shortest high-signal continuity layer for immediate reconstruction

### 7. Recent implementation mirror
- `Claw/logic/recent-implementation-log.md`
- role: compressed recent project memory for what was actually built and changed

### 8. Recovery memory mirror
- `Claw/features/recovery-system/recovery-memory-mirror.md`
- role: recovery-optimized continuity and read order for fallback agents / restart paths

## Anti-Overlap Rule
Do not let every layer become a copy of every other layer.

### Keep the roles distinct
- `MEMORY.md` = durable long-term memory and major progress ledger
- `memory/YYYY-MM-DD.md` = daily chronological notes
- current-state docs = what is true right now
- priority continuity ledger = fastest high-signal current continuity
- recent implementation log = compressed recent build history
- recovery memory mirror = recovery-optimized continuity view
- Drive = human-facing mirror of selected current-state docs
- GitHub backups = historical archives and timestamped recovery artifacts

## Update Flow
After meaningful implementation work:
1. update the relevant source-of-truth system/logic/feature docs
2. update current-state docs
3. write a durable note to `memory/YYYY-MM-DD.md`
4. update `MEMORY.md` when the change is broad/durable enough
5. update the new mirror layers only when their role-specific triggers apply
6. mirror selected current-state docs to Drive
7. let GitHub archival backup capture the current state

## Mirror Trigger Rules
### Update `priority-continuity-ledger.md` when:
- immediate reconstruction would fail without the new information
- routing, ownership, or active system state materially changed

### Update `recent-implementation-log.md` when:
- a meaningful implementation step completed
- a feature/system materially changed

### Update `recovery-memory-mirror.md` when:
- recovery/fallback architecture changed
- backup structure changed
- read order for recovery should change

## Performance Rule
The mirrors should improve recall, not bog it down.

That means:
- keep high-priority mirrors compact
- do not promote every detail into every layer
- keep raw detail in daily logs and archival backups
- keep high-signal compressed views for fast reads and recovery

## Mission Control Relationship
Mission Control should increasingly surface these layers in a selective way:
- plan direction
- current state
- recent implementation history
- recovery/backups/sync readiness

It should not try to display every memory layer at once.

## Status
This document defines the current layered memory/mirror architecture and should guide future refinement.
