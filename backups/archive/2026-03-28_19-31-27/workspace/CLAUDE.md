# Openclaw Workspace — Claude Code Entry Point

You are operating inside the Openclaw workspace. This is Jacob's personal AI operating layer.

## Bootstrap Sequence
1. Read `README.md` for the full system overview and file map.
2. Read `STATE.md` for the current active context, blockers, and phase.
3. Check `.learnings/` for recent errors and corrections to avoid repeating mistakes.
4. Read `ARCHITECTURE/` files only when you need to understand system rules in depth.

## Quick Rules
- **This workspace is the single source of truth.** Google Drive and Manus are passive mirrors.
- **Documentation is runtime logic.** If you change the system, update these files.
- **Finish dependency chains before reporting back.** Do everything that can reasonably be done automatically before asking Jacob.
- **Never patch the compiled OpenClaw UI bundle directly.** Use source-level integration or isolated sidecars.
- **Log corrections and errors to `.learnings/`.** If Jacob corrects you, log it.
- **After significant work, self-reflect in `reflections.md`.**

## Key Files
| File | Purpose |
|------|---------|
| `README.md` | Full system overview & agent bootstrap |
| `STATE.md` | Current state, active tasks, blockers |
| `AGENTS.md` | Agent registry & handoff rules |
| `MEMORY.md` | Long-term crystallized patterns |
| `IDENTITY/USER.md` | Jacob's preferences & adaptation layer |
| `IDENTITY/SOUL.md` | Core truths & personality |
| `ARCHITECTURE/03-Memory-System.md` | How memory, learning, and self-improvement work |
| `ARCHITECTURE/04-Recovery.md` | Crash prevention & backup automation |
