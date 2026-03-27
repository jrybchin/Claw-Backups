# MEMORY.md

## User / Preferences
- The user is Jacob Rybchin and git identity should use `jrybchin@gmail.com` when needed for workspace commits.
- Private writes the user will see directly, like creating/updating Google Docs or calendar items for them, do not require a separate approval step when they directly asked for the task. Outward-facing communication on their behalf still requires explicit approval.
- Keep responses concise by default. Avoid flattering filler, unnecessary examples, redundant sections, and volunteering file paths/locations unless requested or necessary.
- Prefer direct answers and concrete outputs/prompts/commands when useful.

## Claw System Direction
- The `Claw/` folder is the durable system documentation home. Treat it as a coordinated documentation system with `features/`, `systems/`, and `logic/` substructures.
- The Google Drive Claw folder is the main human-facing mirror/reference layer for those instructions and may contain manual edits that matter.
- `Claw Plan` and the dynamic Logic layer are central alignment docs and should receive dedicated maintenance/sweep attention.
- Dynamic/background logic should actively shape behavior even when not being rewritten. Core dynamic docs include: Transplantable System Logic, Response Logic, Documentation Rules, Memory & Source Handling System, and Crash Prevention & Fail-Safe Checklist.
- Index docs should be human-facing table-of-contents docs that only describe documents in the same folder, not subfolders, with brief section-by-section descriptions.
- Relevant new information should proactively propagate across affected Claw docs rather than staying isolated in one place.
- Important continuity should always end up in local workspace files as well, so restarts or session loss do not erase system memory.

## Retrieval / Memory Behavior
- Default retrieval should be reasonably efficient but a little broader than a typical assistant.
- For school/instruction-heavy/system/recovery tasks, use broad to very broad retrieval, preserve raw-source nuance, and avoid guessing.
- Durable memory should mostly store rules, preferences, recurring structures, important lessons, and lasting project directions.
- Drive should be treated primarily as searchable knowledge plus mirrored documentation, not as blind always-loaded memory.

## Recovery / Codex Continuity
- The system emphasizes crash prevention, loop avoidance, runtime verification, known-good states, rollback cleanliness, and backup continuity.
- Codex was connected through a curated Windows mirror of key Claw docs so the Windows Codex app can read system context reliably.
- The mirror is intended as a Codex-facing continuity layer, while the OpenClaw workspace remains the main source of truth.

## Notable Prior Work (2026-03-26)
- GOG was repaired after diagnosing that `GOG_KEYRING_PASSWORD` existed in the shell but not the OpenClaw systemd user service environment; adding a systemd override and restarting fixed Gmail/Docs workflows.
- A substantial Claw documentation architecture was built collaboratively, including recovery-system docs, GOG docs, logic docs, response logic, document-role classification, memory/source handling rules, learning/corrections rules, active task tracking, and the full-sweep maintenance model.
- A Codex recovery skill and Codex mirror workflow were set up so Codex can act as a backup recovery agent using mirrored Claw docs.
- The user wants Claw to function as a modular AI system and personal operating layer: productivity assistant, academic support tool, documentation/recovery system, portfolio project, and eventually a multi-agent/multi-model ecosystem.
- The user strongly prefers broad source capture for assignments, teacher directions, and hidden course materials so important constraints are not missed.

## Durable Behavioral Notes From ChatExport_2026-03-27
- When asked to do a multi-step implementation task, finish the dependency chain before reporting back; do not stop one step early if completion obviously requires another step.
- Use sweep to mean a real propagation/consistency pass across relevant Claw docs, not merely a local-vs-Drive comparison.
- Distinguish local source-of-truth files from Google Drive mirrors, but treat full sweeps as two-way checks so meaningful manual Drive edits can be synced back into local files.
- Keep indexes concise, human-facing, and section-oriented; they are for navigation, not instruction.
- Keep Claw Plan aligned with current logic as an ongoing maintenance expectation, not a rare cleanup task.
- Treat dynamic/background logic as always-running guidance in behavior and research even when those docs are not being actively rewritten.
