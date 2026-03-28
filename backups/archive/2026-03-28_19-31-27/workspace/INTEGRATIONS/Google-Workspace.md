# Google Workspace (GOG) Integration

## Purpose
This document outlines the setup, routing rules, and repair history for the `gog` (Google Workspace) skill within the Openclaw system.

## Account Routing Rules

To ensure Claw chooses the right account consistently across GOG-powered workflows, follow these routing rules:

### `jrybchin@gmail.com` (Personal/General)
**Preferred for:**
- Personal/general context
- GitHub-connected workflows
- Hugging Face-connected workflows
- GPT Premium / general consumer account context
- Non-student personal Docs, Drive, Calendar, and Gmail tasks (unless another account is explicitly better)

### `jrybchin@terpmail.umd.edu` (School/UMD)
**Preferred for:**
- UMD and school workflows
- Student-benefit or student-discount contexts
- School-oriented Docs / Drive / Calendar / Gmail usage
- Workflows where existing school-connected documents already live on Terpmail

**Routing Logic:**
- When a task is clearly school/UMD/student-benefit related, prefer Terpmail.
- When a task is clearly personal/general, prefer Gmail.
- When the task is ambiguous and account choice matters, ask Jacob or use the most contextually likely account.

## Setup & Configuration

The GOG skill is enabled in `openclaw.json` (`gog.enabled = true`).

### Authentication
Interactive OAuth must be run manually by Jacob in the WSL terminal.
- **Command:** `gog auth add <email> --services <service_list>`
- **Example:** `gog auth add jrybchin@gmail.com --services gmail`

### Known Issues & Repair Log
**Issue (2026-03-26):** GOG failed to authenticate during automated workflows.
**Diagnosis:** The `GOG_KEYRING_PASSWORD` existed in the interactive shell but was missing from the OpenClaw systemd user service environment.
**Fix:** Added a systemd override to inject the `GOG_KEYRING_PASSWORD` into the service environment and restarted the gateway. This fixed Gmail and Docs workflows.

## Drive Live-Sync
A backend process exists to live-sync selected local workspace documents (like `STATE.md`) to Google Drive.
- **Manifest:** `Claw/systems/drive-live-sync-manifest.json` (defines which files sync where).
- **State:** `Claw/systems/drive-live-sync-state.json` (tracks last sync time and file hashes).
- **Rule:** Google Drive is a passive mirror for human reference. The WSL workspace remains the single source of truth for agent logic.
