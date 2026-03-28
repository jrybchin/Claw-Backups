# Memory Persistence Fix

## Purpose
Prevent important context from being lost when sessions reset, compact, or the computer restarts.

## Problem
OpenClaw memory continuity is weak by default if important state remains only in live chat context.

The failure pattern is:
- useful decisions happen in chat
- they are not written into workspace files promptly
- a restart, session reset, or compaction happens
- continuity is lost even though the project docs still exist

## Real Fix
Continuity should rely on durable files plus searchable session history, not on session context alone.

## Recommended OpenClaw Configuration
These settings are supported by the OpenClaw docs and should be enabled in runtime config.

### 1. Pre-compaction memory flush
Use a better memory flush prompt so compaction writes durable notes into `memory/YYYY-MM-DD.md` before context is trimmed.

Example shape:
```json5
agents: {
  defaults: {
    compaction: {
      memoryFlush: {
        enabled: true,
        softThresholdTokens: 32000,
        prompt: "Write a durable session note to memory/YYYY-MM-DD.md. Capture: decisions, constraints, open questions, owners, and any state that would break the plan if forgotten. If nothing meaningful happened, write NO_FLUSH.",
        systemPrompt: "Be terse. Prefer bullet points. Do not rewrite the conversation."
      }
    }
  }
}
```

### 2. Session transcript indexing
Enable session transcript indexing so past conversations become searchable through memory search.

Example shape:
```json5
agents: {
  defaults: {
    memorySearch: {
      experimental: { sessionMemory: true },
      sources: ["memory", "sessions"]
    }
  }
}
```

## Workspace Rules That Must Exist Even With Good Config
Even with runtime support enabled, Claw should still:
- write important decisions into `MEMORY.md`, daily memory files, or relevant `Claw/` docs promptly
- extract durable context from Drive docs or long transcripts instead of leaving it stranded there
- treat local workspace files as the continuity backbone
- avoid relying on compaction or indexing as a substitute for writing down important context

## Best Durability Model
Use all three layers together:

### 1. Durable workspace memory
- `MEMORY.md`
- `memory/YYYY-MM-DD.md`
- relevant `Claw/` docs

### 2. Session transcript search
- searchable session logs for recall when needed
- useful for reconstruction and finding forgotten details

### 3. Drive mirror/reference layer
- human-facing instruction and history layer
- helpful for manual edits and continuity backup
- should not be the only place important state lives

## Manual Maintenance Habit
Review memory files periodically and remove noise.

Good manual review prompt:
- "List the key decisions from this session that we can save to memory."

## Operational Rule
Anything important enough to regret losing after a restart should be written into a durable local file during or immediately after the session.

## Status
This document defines the continuity fix direction and should be used when hardening OpenClaw memory behavior.
