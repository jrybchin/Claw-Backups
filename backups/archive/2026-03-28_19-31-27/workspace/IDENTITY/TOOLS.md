# TOOLS.md - Local Environment Notes

Skills define *how* tools work. This file is for the specifics that are unique to Jacob's setup. Keeping them apart means skills can be updated without losing notes, and skills can be shared without leaking infrastructure details.

## Current Environment Details

The system operates primarily within a WSL (Windows Subsystem for Linux) environment on an Ubuntu 24.04 distribution. The main workspace is located at `~/.openclaw/workspace/`.

The system is multi-provider, utilizing a local Ollama instance as the primary engine for the `main` agent, with Anthropic and OpenAI Codex configured as fallbacks and specialized agents.

## Known Tool Configurations

### Speech-to-Text
The active speech-to-text path uses `ffmpeg`, a local Python virtual environment, `faster-whisper`, and a local wrapper script. It is explicitly configured in OpenClaw under `tools.media.audio`. This setup allows for local, private transcription of Telegram voice notes without relying on cloud APIs.

### Google Workspace (GOG)
The GOG skill is enabled and requires the `GOG_KEYRING_PASSWORD` to be present in the OpenClaw systemd user service environment. Interactive OAuth for Gmail (`jrybchin@gmail.com`) must be run manually by Jacob in the WSL terminal using the command `gog auth add jrybchin@gmail.com --services gmail`.

### Mission Control
Mission Control is a local Next.js application running on `http://127.0.0.1:3001/`. It serves as the control surface for the system. The OpenClaw web UI is served on `http://127.0.0.1:18889/`.

## Adding New Tools
When adding new environment-specific details, such as SSH hosts, camera locations, or preferred TTS voices, document them here rather than in the shared skill files.
