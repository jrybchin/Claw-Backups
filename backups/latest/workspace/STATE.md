# System State & Active Context

## Purpose
This is the highest-priority continuity mirror for fast reconstruction. It serves as the shared current-state document for all Clawbot agents. Use this file when another agent, a restarted session, or a backup path needs the shortest high-signal summary of what matters right now.

## Current Owner & Phase
- **Owner:** `main`
- **Phase:** ready
- **Objective:** maintain a stable multi-agent, multi-provider OpenClaw structure

## Current Known-Good State
- `ollama` local instance usable as primary for `main`
- `openai-codex` auth profile present and usable (OAuth, jrybchin@gmail.com)
- `anthropic` auth profile present and usable (API key, anthropic:manual)
- **Provisioned agents:**
  - `main` — `ollama/qwen2.5:7b` (local, with claude/codex fallbacks)
  - `schoolwork` — `anthropic/claude-opus-4-6` (977k ctx, for academic work)
  - `claude-overflow` — `anthropic/claude-sonnet-4-6` (977k ctx, for GPT load offload)
- `[served-runtime-confirmed]` OpenClaw portal `http://127.0.0.1:18889/` is the active portal
- `[served-runtime-confirmed]` local Mission Control app available on `http://127.0.0.1:3001/`
- `[filesystem-confirmed]` active OpenClaw bundle is the rollback-safe bundle without native missionControl route wiring
- `[served-runtime-confirmed]` sidecar asset delivery live via `assets/mission-control-sidebar-sidecar.js`

## Active Context & Priorities
- Telegram voice-note speech-to-text is up and working (uses `ffmpeg`, local STT venv, `faster-whisper`, local wrapper script).
- Mission Control exists as a local Next.js control surface. The live OpenClaw UI is currently the rollback-safe bundle on `18889` rather than a native Mission Control route.
- Mission Control is currently being shaped into a command center for future systems, feature implementation tracking, and Tool Forge work.
- Google Drive should be treated as the main human-facing mirror/reference layer, but the local workspace remains the main editable source-of-truth layer.
- The current chat-return / heartbeat problem appears deeper than pure UI selection and should be treated as a backend/session-state issue until proven otherwise.
- Codex is currently building a fallback agent using GPT 5.3 in case rate limits hit again.

## Current Blockers & Immediate Risks
- `[not-yet-reconciled]` Mission Control sidecar button visible render not yet confirmed in live browser — JS is served but visual attachment in sidebar is unverified.
- `[not-yet-reconciled]` GOG gateway restart after `gog.enabled = true` edit not confirmed — may not yet appear on native skills page.
- Gmail (`jrybchin@gmail.com`) not yet authenticated in GOG for WSL — requires interactive OAuth; Jacob must run manually.
- Stale memory can still describe the old native Mission Control route as if it were live.
- Compiled control-ui hot patches can contaminate the live bundle and produce a blank black screen.
- Codex and Clawbot can still diverge if runtime truth is not explicitly reconciled between served-runtime facts, filesystem facts, and mirrored facts.

## Active Tasks List
### High Priority
1. **Mission Control UI Re-integration:** Re-introduce Mission Control into OpenClaw only through a safe source-level or isolated-sidecar path.
2. **GPT 5.3 Fallback Bot:** Finish the GPT 5.3 backup/fallback bot path. Await further Codex clarification on the fallback-agent path while preserving the context in durable files.
3. **Session/Heartbeat Issue:** Diagnose the deeper session/heartbeat/backend issue with a better runtime-focused strategy.
4. **Telegram Routing:** Set up Telegram routing so messages tagged for schoolwork auto-route to the `schoolwork` agent.

### Ongoing Maintenance
- Refine the memory mirror architecture so layers stay high-signal without redundant overlap.
- Keep Drive docs current enough to serve as a real passive progress-tracking surface.
- Continue reducing brittle compiled-UI dependence where possible.

## Recent Implementation Log
- Reorganized Mission Control around a Claw Plan-first layout and richer command-center framing in the local app.
- Added a live Mission Control data layer in the local Next.js app with a priority-source manifest and snapshot generation.
- Rolled back the live compiled Mission Control route after a confirmed blank-black-screen failure and restored the known-good OpenClaw bundle on `18889`.
- Added a same-origin sidecar asset path for future Mission Control button experiments without re-contaminating the compiled bundle.
- Built a Drive live-sync backend process for selected live/current docs.
- Replicated the multi-agent coordination docs into the Ubuntu workspace from the shared Windows mirror.
- Rewrote the GitHub backup system to preserve archival timestamped backups and timestamped MEMORY exports.
- Ran a dedicated Claw Plan alignment pass: added Jacob adaptation system, Mission Control sidecar architecture, multi-agent coordination layer, layered memory mirror architecture, GOG account routing, OpenClaw web UI debugging rules.

## Recovery Brief (If you just woke up after a crash)
- **What happened:** The system was rolled back from a blank-black-screen failure caused by compiled-bundle UI patching.
- **Current safe state:** The rollback-safe bundle is active on `18889`. Mission Control is isolated on `3001`.
- **Next safe step:** Debug the current sidecar/button attach issue from the clean rollback baseline. If that fails twice, stop and move to a source-level OpenClaw UI path instead of touching the compiled bundle again.
