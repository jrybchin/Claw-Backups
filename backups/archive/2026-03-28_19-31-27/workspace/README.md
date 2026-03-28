# Openclaw Workspace

Welcome to the Openclaw system. This workspace is the **single source of truth** for all agent logic, memory, and state.

**If you are an agent waking up here, read this first.**

## The Golden Rule
**Documentation is Runtime Logic.** The files in this workspace dictate how you behave, how you communicate, and how you recover from failure. If you change the system, you must update these files. Google Drive and Manus projects are passive mirrors; this workspace is the canonical home.

## Self-Improving Agent Architecture
This system is designed to evaluate its own work, catch mistakes, and improve permanently. Knowledge compounds over time through a tiered memory system.

### Memory Tiers
- **HOT (`MEMORY.md`, `IDENTITY/USER.md`):** Always loaded. Global rules and preferences.
- **WARM (`projects/`, `domains/`):** Load on demand based on context.
- **COLD (`archive/`):** Decayed patterns. Load only on explicit query.
- **LOGS (`corrections.md`, `reflections.md`):** Active learning signals.

## Where to Look

### 1. Immediate Context
- **`STATE.md`**: Read this immediately to understand what is currently happening, what is broken, and what your active task is.
- **`AGENTS.md`**: The registry of active agents, their roles, and handoff rules.

### 2. Core Architecture
- **`ARCHITECTURE/01-Manifesto.md`**: The philosophy of the system.
- **`ARCHITECTURE/02-Communication.md`**: How to talk to Jacob and how to write documentation.
- **`ARCHITECTURE/03-Memory-System.md`**: How to store, recall, and learn from information (Tiered Memory & Self-Reflection).
- **`ARCHITECTURE/04-Recovery.md`**: What to do when things break (Crash prevention, Codex recovery).

### 3. Identity & Environment
- **`IDENTITY/USER.md`**: Jacob's profile, preferences, and the adaptation layer.
- **`IDENTITY/SOUL.md`**: Your core truths and boundaries.
- **`IDENTITY/TOOLS.md`**: Local environment specifics (SSH, cameras, etc.).

### 4. Integrations
- **`INTEGRATIONS/`**: Setup and routing rules for external systems (Google Workspace, Windows Codex, Speech-to-Text).

## How to Operate
1. **Check `STATE.md`** to orient yourself.
2. **Check `.learnings/`** (errors, learnings, feature-requests) to ensure you don't repeat recent mistakes.
3. **Execute your task**, following the rules in `ARCHITECTURE/02-Communication.md`.
4. **Self-Reflect:** After significant work, log your outcome and lessons to `reflections.md`.
5. **Log Corrections & Errors:** If Jacob corrects you, or you hit a recurring error, log it to the `.learnings/` directory.
6. **Update `STATE.md`** if you change the active context or hit a blocker.
7. **Never patch the compiled OpenClaw UI bundle directly.** (See `04-Recovery.md`).
