# Codex ↔ Clawbot Runtime Truth Protocol

## Purpose
Prevent Codex and Clawbot from operating from different runtime truths without explicitly detecting and resolving the mismatch.

This protocol exists because a shared doc system is not enough if the agents are observing different active bundles, runtimes, services, or mirrored file states.

## Core Rule
It is unacceptable for Codex and Clawbot to proceed for long while silently disagreeing about the current live state.

If runtime truth diverges, stop feature work and reconcile the active truth first.

## What Must Match Before Claiming Shared Understanding
At minimum, Codex and Clawbot should agree on:
1. current active workspace path
2. current active mirrored path(s)
3. current active portal URL and port
4. current active served asset name(s)
5. whether evidence came from filesystem inspection or live served runtime inspection
6. whether a feature is historical, experimental, rollback-only, or current live truth

## Required Runtime Truth Checkpoints
### 1. Filesystem truth
- Which file is being inspected?
- On which machine/runtime?
- Is it the local source-of-truth file or only a mirrored copy?

### 2. Served-runtime truth
- What exact asset is the live UI serving right now?
- What exact health endpoint is answering?
- Does the observed live behavior match the file belief?

### 3. Continuity truth
- Have the high-priority continuity docs been updated to reflect the current reality?
- Have invalidated assumptions been recorded explicitly?

## Evidence Tagging Rule
When reporting state, label each claim as one of:
- `filesystem-confirmed`
- `served-runtime-confirmed`
- `mirror-confirmed`
- `historical-only`
- `not-yet-reconciled`

Do not blur these together.

## Invalidated Assumptions Rule
Whenever rollback or recovery happens, record:
- what used to be believed true
- why it is no longer safe to assume
- what the new known-good state is

This must be written into the continuity layer, not just spoken in chat.

## Reconciliation Trigger Rules
Force a runtime-truth reconciliation when:
- Codex and Clawbot disagree on current live state
- one side sees files the other cannot see
- a UI bundle/path is patched or rolled back
- a portal/port changes
- a feature is described as current live truth after a rollback or partial recovery

## Required Read Order During Reconciliation
1. `Claw/features/recovery-system/live-system-status-report.md`
2. `Claw/logic/priority-continuity-ledger.md`
3. `LIVE-STATE.md`
4. `RECOVERY-BRIEF.md`
5. `Clawbot-Handoff.md`
6. any incident-specific debugging rules doc

## Operational Rule For Codex And Clawbot
Before either agent says “this is the current live state,” confirm whether that statement is:
- filesystem-only
- served-runtime-confirmed
- historical implementation state
- desired target state

If unclear, say so explicitly and do not collapse those categories.

## Mission Control / OpenClaw UI Specific Rule
For Mission Control or OpenClaw UI work, do not claim the route/button/sidebar state is current live truth unless:
- the active served asset is identified
- the route/button/sidebar is visible in the live UI
- the continuity docs were updated to match that result

## Handoff Rule
If Codex gives Clawbot instructions based on a runtime observation, include:
- exact runtime observed
- exact file or asset path
- whether it was served/live or filesystem-only
- what assumptions are invalidated
- what the next safe step is

## Status
This protocol is part of the continuity backbone and should be followed whenever Codex and Clawbot collaborate on runtime-sensitive work.
