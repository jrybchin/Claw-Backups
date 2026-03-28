# Windows Codex Integration & Mirror

## Purpose
This document outlines the setup and connection between the Ubuntu WSL Openclaw environment and the OpenAI Codex agent running on the Windows host. Codex serves as a backup recovery agent and a secondary reasoning engine.

## The Codex Mirror

Because Codex runs on the Windows host, it cannot natively read the WSL filesystem without complex mounting. To solve this, a subset of critical Claw documents is mirrored to a Windows directory.

- **WSL Source:** `~/.openclaw/workspace/`
- **Windows Mirror Target:** `C:\Users\jrybc\Codex-Claw-Mirror\`

### Mirror Selection Rules
Do not mirror the entire workspace. Mirror only the most important documents for:
- Central alignment (`README.md`, `STATE.md`, `AGENTS.md`)
- Core system understanding (`ARCHITECTURE/01-Manifesto.md`)
- Recovery (`ARCHITECTURE/04-Recovery.md`)

### Immediate Sync Rule
After a high-value change (e.g., updating `STATE.md` with a new blocker, or changing recovery logic), trigger an immediate sync to the Codex mirror so the backup agent is not operating on stale data.

## Codex Connection Setup

### Authentication
Codex is authenticated via OAuth in the OpenClaw configuration.
- **Command to re-authenticate:** `openclaw models auth login --provider openai-codex`
- **Account:** `jrybchin@gmail.com`

### Fallback Agent Path
Codex is currently being configured to build a fallback agent using `gpt-5.3-codex` in case the primary Anthropic or Ollama models hit rate limits.
- **Status:** Active priority. Await further Codex clarification on the fallback-agent path while preserving the context in durable files.

## Runtime Truth Protocol (Codex ↔ Clawbot)
When Codex and Clawbot are working in parallel, they must not proceed while silently disagreeing about live runtime state.
- If Codex changes a file in the mirror, it must be synced back to WSL.
- If Clawbot changes a file in WSL, it must be synced to the mirror.
- Both agents must read `STATE.md` before taking destructive actions to ensure they are aware of what the other is doing.
