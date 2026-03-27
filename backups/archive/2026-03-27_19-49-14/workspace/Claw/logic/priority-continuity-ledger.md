# Priority Continuity Ledger

## Purpose
This is the highest-priority continuity mirror for fast reconstruction.

Use this file when another agent, a restarted session, or a backup path needs the shortest high-signal summary of what matters right now.

It should stay narrower and more current than `MEMORY.md`.

## What Belongs Here
Only include items that are both:
- highly important for continuity
- likely to matter immediately on the next reconstruction or handoff

Examples:
- current active system-building focus
- active blockers
- high-impact recent changes
- new continuity/recovery layers
- important fallback/backup state
- the most important currently-active user directions

## Current Priority State
- Mission Control is now both a local Next.js app and an OpenClaw-integrated route.
- A shared Mission Control snapshot payload now exists so the local app and integrated route can be driven from the same current-state model.
- A Drive live-sync layer exists for selected live/current docs.
- The GitHub backup system now preserves archival history and timestamped MEMORY exports instead of replacing a single latest backup.
- Multi-agent coordination docs are now local and durable in the workspace (`AGENT-REGISTRY.md`, `LIVE-STATE.md`, `RECOVERY-BRIEF.md`, `PROVIDER-AUTH-SETUP.md`, `CLAWBOT-HANDOFF.md`).
- The system should no longer be treated as single-agent only.
- Only `openai-codex` is authenticated right now; provider-level resilience is still incomplete.
- Finishing the GPT 5.3 backup/fallback bot path remains an active priority.

## Current Immediate Risks
- Mission Control integration still includes compiled control-ui patching, which is more brittle than a source-level integration.
- The deeper chat/session/heartbeat issue is not fully resolved yet at the backend/session layer.
- Memory and continuity are much stronger now, but still need refinement to avoid overlap and stale mirrors.

## Update Rule
Update this file only when a change is important enough that losing it would materially harm immediate reconstruction, routing, or safe continuation.
