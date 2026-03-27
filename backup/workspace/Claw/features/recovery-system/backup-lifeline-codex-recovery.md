# Backup Lifeline: Codex Recovery Workflow

## Purpose
Provide a reliable backup recovery path if the main Claw assistant becomes unavailable, degraded, confused, disconnected, or unable to safely complete diagnosis and recovery.

This document is meant to act as a reusable handoff framework so recovery can happen with minimal user friction and minimal context loss.

## Why This Exists
The backup lifeline exists to solve these problems:
- the main assistant crashes or becomes unavailable
- troubleshooting starts looping or degrading in quality
- the user is forced to manually relay fragmented context
- multiple AIs create confusion instead of clarity
- important state, setup knowledge, or progress risks being lost

## Design Goal
The backup path should:
- be reliable
- be structured
- reduce manual translation work by the user
- restore a known-good state quickly
- avoid adding a second layer of confusion
- preserve continuity across failures

## Primary Model
- **Primary system:** Claw / main assistant
- **Backup system:** Codex
- **User role:** minimal manual relaying, only when needed

## When to Use the Lifeline
Use Codex as the backup path when:
- the main assistant is unavailable
- the main assistant is clearly stuck in low-value loops
- diagnosis is blocked by degraded runtime state
- the recovery path requires an external second opinion
- continuity is at risk and a clean recovery brief is needed

## Handoff Requirements
When handing work to Codex, provide a structured recovery brief rather than scattered chat fragments.

The brief should include:
- current problem
- exact failure symptoms
- current known-good state
- last known working point in time
- recent changes made
- attempted fixes
- confirmed facts
- likely cause if known
- desired recovery goal
- constraints or things not to disturb

## Minimum Recovery Brief Template
### System Status
- What is broken?
- What still works?
- What was the last known-good state?

### Recent Changes
- What changed before failure?
- Were config, service, integration, or docs changed?

### Evidence
- Exact error messages
- Runtime or service state findings
- Environment findings
- Tool outputs that matter

### Attempts Already Made
- What was tried?
- What changed?
- What failed?

### Recovery Goal
- Restore what specific capability?
- Roll back to which clean state if needed?

### Constraints
- Avoid deleting durable docs or user work
- Avoid introducing overlapping speculative fixes
- Prefer reversible changes

## Recovery Philosophy
- Restore stability before reintroducing complexity.
- Prefer clean rollback over messy patch layering.
- Protect user work product separately from runtime recovery.
- Keep diagnosis evidence clear and compact.
- Minimize the amount of interpretation the user has to do.

## Codex Coordination Rules
- Codex should receive clear ownership when acting as the backup diagnostician.
- Avoid having Claw and Codex make overlapping uncontrolled edits.
- If Codex is engaged, the task should specify whether Codex is diagnosing, editing, validating, or all three.
- Use one primary controller at a time during recovery.
- If context is incomplete, prioritize confirmed facts over speculation.

## What the User Should Ideally Need To Do
Ideally, the user should only need to:
- trigger the backup path
- provide or paste the structured recovery brief if needed
- approve sensitive changes when necessary
- confirm whether the restored state works

Everything else should be minimized or automated where practical.

## Future Automation Goal: Active Bridge
A strong future feature would be an **active bridge** between Claw and Codex.

### Ideal behavior
- Claw prepares recovery context before major failures
- Claw maintains a concise current-state snapshot
- If Claw becomes degraded, Codex can use the snapshot to diagnose quickly
- The user does not need to reconstruct the whole problem manually

### What an active bridge would likely need
- a standard handoff document or machine-readable state snapshot
- a clear trigger for backup activation
- a defined ownership model between primary and backup systems
- a compact status summary that can be refreshed over time
- rules for what gets synced and what stays local

### Important caution
An active bridge is promising, but if it is built badly it can create:
- duplicated context
- stale state
- conflicting edits
- two-AI confusion
- extra complexity during failures

So if built, it should emphasize clarity, structure, and explicit responsibility.

## Suggested Next Steps
1. Keep refining this recovery workflow
2. Create a standard recovery brief template
3. Create a system status snapshot format
4. Decide how often state should be refreshed for Codex
5. Define when backup activation should happen automatically vs manually

## Status
This is an active feature concept and should evolve as the recovery system matures.
