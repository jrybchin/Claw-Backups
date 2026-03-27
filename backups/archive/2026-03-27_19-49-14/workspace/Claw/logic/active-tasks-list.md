# Active Tasks List

## Purpose
This checklist tracks the current highest-priority work so the system does not split focus too widely.

Use this as the active queue for step-by-step work.

## Current Active Tasks
- [x] Complete a full read/export inventory of the Claw Drive folder and subfolders
- [x] Compare the exported Drive docs against the local Claw source-of-truth docs
- [x] Identify where the real drift lives (live/current-state docs rather than the core philosophy layer)
- [x] Update the local live/current docs so they reflect the actual present system state
- [x] Mirror those refreshed live/current docs back into the corresponding Drive docs
- [x] Decide which newer local continuity/system docs should become first-class mirrored Drive docs
- [ ] Give **Claw Plan** a dedicated pass so it reflects Mission Control / Tool Forge / control-surface direction, memory backup/update behavior, and multi-agent coordination more explicitly
- [ ] Turn Mission Control’s current native OpenClaw page into a more real stateful surface instead of a static scaffold
- [ ] Convert Mission Control’s internal sub-nav scaffold into actual content/state switching
- [ ] Define the next MVP Tool Forge builder layer so it can move from concept UI to real generation/execution/promotion flow
- [ ] Diagnose the deeper session / heartbeat / chat-return issue at the backend/session layer instead of continuing UI-only patch loops
- [x] Build and validate an unobtrusive backend process that keeps local live/current docs and mirrored Drive docs more continuously in sync
- [ ] Refine the new memory mirror architecture so the layers stay high-signal without creating redundant overlap
- [ ] Finish documenting and refining the memory backup / update system so it becomes a standard completion path after implementation work
- [ ] Finish the implementation path for the GPT 5.3 backup / fallback bot for rate limits and context-window pressure
- [ ] Incorporate the multi-agent coordination docs more deeply into Mission Control and continuity/recovery tracking
- [x] Create a shared exported Mission Control live snapshot payload so both surfaces can read the same actual current-state data model
- [x] Make the OpenClaw-integrated Mission Control route consume the shared exported snapshot payload directly instead of only mirroring its structure

## Deferred / Lower Priority For Now
- [ ] Broader response-logic refinement beyond current essentials
- [ ] Feature lifecycle system beyond the Mission Control / Tool Forge path
- [ ] Broader expansion-oriented feature planning beyond current control-surface and continuity needs
- [ ] Additional UI polish that does not unlock real structure or state behavior

## Working Rule
Handle these one at a time rather than splitting attention too broadly.

If two attempts at the same layer fail without decisive new evidence, switch strategy instead of repeating near-identical fixes.

## Status
This document should be used as the current focused checklist until the active queue is reduced.
