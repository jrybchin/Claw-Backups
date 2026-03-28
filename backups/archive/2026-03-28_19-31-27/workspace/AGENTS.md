# Agent Registry & Handoff Rules

## Purpose
This document is the authoritative registry for the active Openclaw agent roster. Use it to understand which agents exist, what each one is for, which model each one prefers, who should own a task, and when control should hand off.

## Active Agents

### `main` (Clawbot)
- **Role:** primary controller
- **Primary model:** `ollama/qwen2.5:7b`
- **Fallbacks:** `anthropic/claude-sonnet-4-6` (live), `anthropic/claude-opus-4-6`, `openai-codex/gpt-5.4`
- **Responsibilities:** own the main conversation, decide routing, keep shared state current.
- **Note:** Claude Sonnet auto-engages when Ollama is unavailable or rate-limited.

### `manus` (Manus AI)
- **Role:** autonomous general agent / heavy lifter
- **Provider:** `manus.im`
- **Capabilities:** full sandboxed VM, browser automation, file system access, external API integration, long-running tasks.
- **Responsibilities:** execute complex, multi-step tasks that require a clean environment, deep research, web scraping, or heavy file manipulation.
- **Integration:** Manus operates in its own cloud sandbox but syncs with the Openclaw system via the "Openclaw" Manus Project and the Codex mirror.

### `schoolwork`
- **Role:** academic assistant
- **Provider:** `anthropic`
- **Primary model:** `anthropic/claude-opus-4-6` (977k context)
- **Auth:** `anthropic:manual` (API key)
- **Responsibilities:** handle school assignments, research, writing, studying.
- **Agent dir:** `~/.openclaw/agents/schoolwork/agent`

### `claude-overflow`
- **Role:** ChatGPT overflow / load reduction
- **Provider:** `anthropic`
- **Primary model:** `anthropic/claude-sonnet-4-6` (977k context)
- **Auth:** `anthropic:manual` (API key)
- **Responsibilities:** absorb overflow when ChatGPT is rate-limited, always-available second path.
- **Agent dir:** `~/.openclaw/agents/claude-overflow/agent`

## Docs-Only Agents (Not Yet Provisioned)
These agents are documented for future use but are not active in the config.
- **`recovery-backup`**: backup recovery agent (`openai-codex/gpt-5.3-codex`)
- **`coding-specialist`**: coding specialist (`openai-codex/gpt-5.4`)
- **`research-specialist`**: research specialist (`openai-codex/gpt-5.4-mini`)
- **`planner`**: planner / coordinator (`openai-codex/gpt-5.4-mini`)

## Provider Auth Setup
- **`ollama`**: local instance, primary for `main` — live
- **`openai-codex`**: authenticated via OAuth (jrybchin@gmail.com) — live
  - Reauth command: `openclaw models auth login --provider openai-codex`
- **`anthropic`**: authenticated via API key (anthropic:manual) — live
  - Reauth command: `openclaw models auth paste-token --provider anthropic`

## Shared Communication & Handoff Rules
- All agents read and write through `STATE.md`.
- Do not create competing private summaries when `STATE.md` can be updated instead.
- **Handoff Protocol (General):**
  - When an agent hits a hard limit (rate limit, context window, capability gap), it must write a clean handoff note in `STATE.md` before stopping.
  - The handoff note must include: what was being done, what failed, what the next agent should do, and any relevant file paths.
  - The next agent must read `STATE.md` immediately upon waking up to resume the task seamlessly.
- **Handoff Protocol (To Manus):**
  - To hand off a heavy task to Manus, Clawbot should update `STATE.md` with the task requirements and instruct Jacob to "Send this to Manus."
  - Jacob can then prompt Manus in the Openclaw project. Manus will automatically read the project files and `STATE.md` (if synced) to pick up the context.
- **Runtime Truth:** Codex and Clawbot must not proceed while silently disagreeing about live runtime state. Follow the separation of served-runtime facts vs filesystem facts.
