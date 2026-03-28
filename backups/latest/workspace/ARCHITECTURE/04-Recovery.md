# Recovery & Fail-Safe System

## Purpose
This document outlines the crash prevention, fail-safe logic, and recovery procedures for the Openclaw system. The system assumes failure is possible and prioritizes the ability to recover cleanly over pushing brittle updates. **Posterity of crash recovery systems and consistent export of logs are paramount.**

## Core Recovery Principles
1. **Runtime Truth Separation:** Never confuse what is written on disk with what is actually running. Distinguish between served-runtime facts, filesystem facts, mirror facts, and historical facts.
2. **Rollback Safety:** Always maintain a known-good state. If an experiment fails twice, stop and switch strategies. Do not keep pushing broken code into the live bundle.
3. **Backup Continuity:** Ensure memory and state are backed up so a crash does not result in amnesia.

## Automated Backups & Log Exports
To ensure the posterity of the system and prevent catastrophic data loss, the following automated backup systems are in place and **must not be disabled or bypassed**:

1. **GitHub Backup Automation:** A sanitized backup script runs via a daily cron job (e.g., 4:30 AM). It pushes the entire workspace state to a private GitHub repository.
2. **Timestamped Archival:** The backup system preserves archival timestamped backups rather than just overwriting a single "latest" state.
3. **Memory Exports:** Timestamped exports of `MEMORY.md`, `STATE.md`, and the `daily-logs/` directory are included in the backup to ensure the agent's learning history is preserved.
4. **Sign-off Trigger:** Agents should trigger a manual backup push after completing a major implementation or recovery milestone.

## Crash Prevention & Fail-Safe Checklist

### Before Making High-Risk Changes (UI, Routing, Core Logic)
- [ ] Verify the current known-good state in `STATE.md`.
- [ ] Confirm the active portal and bundle (e.g., `18889` is active, rollback-safe bundle is on disk).
- [ ] Ensure `STATE.md` and `MEMORY.md` are fully up to date and flushed to disk.
- [ ] Do not treat compiled-bundle patching as a normal development path. Prefer source-level integration or isolated sidecars.

### During Implementation
- [ ] If a UI experiment fails twice, **STOP**. Record the failure in `STATE.md` and switch to a safer strategy (e.g., isolated sidecar).
- [ ] Do not assume a `200 OK` health endpoint means the rendered UI is healthy. Verify visual rendering if possible.

## Codex Recovery Workflow (Backup Lifeline)

If the main Clawbot agent or the local OpenClaw UI crashes completely, the system relies on a backup lifeline via OpenAI Codex running on the Windows host.

### The Codex Mirror
A subset of critical Claw documents is mirrored to a Windows folder accessible by Codex (`C:\Users\jrybc\Codex-Claw-Mirror\`). This ensures Codex has the context needed to repair the Ubuntu WSL environment.

### Recovery Agent Instructions (For Codex)
If you are Codex waking up to a broken Clawbot system:
1. **Read the Mirror:** Start by reading `STATE.md` and this `04-Recovery.md` file in your mirror directory.
2. **Diagnose:** Determine if the failure is a UI crash (blank black screen), a backend/session issue (heartbeat failure), or a rate-limit/provider issue.
3. **Restore Known-Good State:** If the UI is broken, restore the last known-good compiled bundle. Do not attempt to hot-patch the broken bundle.
4. **Update State:** Once the system is stable, update `STATE.md` to reflect the recovery action and hand control back to the `main` agent.

## OpenClaw Web UI Debugging Rules (Post-Mortem 2026-03-27)

**The Incident:** A direct patch to the compiled `control-ui` bundle to add native Mission Control routes caused a blank-black-screen failure.

**The Rule:** Never treat direct compiled-bundle OpenClaw UI patching as a normal development path. The compiled bundle is brittle.

**The Safe Path:**
- Mission Control must be treated as a separate sidecar app, usually opened in its own browser tab/window on `http://127.0.0.1:3001/`.
- If integration into the OpenClaw UI is required, use a same-origin sidecar asset path (`assets/mission-control-sidebar-sidecar.js`) that does not contaminate the core routing logic of the compiled bundle.
- If the sidecar attachment fails, do not revert to bundle patching. Move to a source-level OpenClaw UI path instead.
