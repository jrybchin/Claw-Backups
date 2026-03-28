# Channel Active Context

## Purpose
Provide a compact current-context note that other sessions/channels can reconstruct from quickly.

## Current Active Context
- Telegram voice-note speech-to-text is up and working.
- The active STT path uses `ffmpeg`, a local STT venv, `faster-whisper`, a local wrapper script, and explicit `tools.media.audio` config in OpenClaw.
- Mission Control exists as a local Next.js control surface, while the live OpenClaw UI is currently the rollback-safe bundle on `18889` rather than a native Mission Control route.
- Mission Control is currently being shaped into a command center for future systems, feature implementation tracking, and Tool Forge work.
- A full Claw Drive read/export sweep has been completed locally and the current task is refreshing local live/current docs first, then mirroring them into Drive.
- Google Drive should be treated as the main human-facing mirror/reference layer, but the local workspace remains the main editable source-of-truth layer.
- The current chat-return / heartbeat problem appears deeper than pure UI selection and should be treated as a backend/session-state issue until proven otherwise.
- Codex is currently building a fallback agent using GPT 5.3 in case rate limits hit again; await further instructions from Codex for clarity before making assumptions about that fallback path.

## Current Priority
- Re-introduce Mission Control into OpenClaw only through a safe source-level or isolated-sidecar path.
- Keep Drive docs current enough to serve as a real passive progress-tracking surface.
- Await further Codex clarification on the fallback-agent path while preserving the context in durable files.

## Update Rule
Refresh this file whenever an active buildout or high-impact temporary context would materially help another session/channel behave less blindly.
