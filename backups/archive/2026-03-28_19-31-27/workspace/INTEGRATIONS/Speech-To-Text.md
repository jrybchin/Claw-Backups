# Speech-to-Text (STT) Integration

## Purpose
This document outlines the chosen speech-to-text architecture for the Openclaw system, specifically for handling Telegram voice notes and other audio inputs.

## Chosen Skill: `speech-to-text-transcription`

After evaluating multiple options (`speech-to-text`, `speech-to-text-transcription`, `elevenlabs-stt`), `speech-to-text-transcription` was selected as the best fit for the Openclaw architecture.

### Why it was chosen:
- **Flexibility:** Supports both local-first workflows (Whisper) and paid higher-end cloud workflows (OpenAI, AssemblyAI, Deepgram).
- **Modularity:** Fits the system's preference for optionality and future expansion.
- **Cost Control:** Allows for free local transcription by default, with the option to use paid APIs only when higher quality or diarization is needed.
- **Horizontal Integration:** Strongest operational guidance for real-world transcription workflows (handling long audio, preprocessing with `ffmpeg`, splitting, and output formats).

## Current Setup (Local First)

The active STT path is configured for local execution to ensure privacy and avoid API costs for standard Telegram voice notes.

- **Backend:** `faster-whisper` (lighter than the Torch-based OpenAI Whisper Python path).
- **Dependencies:** `ffmpeg` (for audio preprocessing), Python virtual environment.
- **Wrapper:** A local wrapper script handles the execution.
- **Configuration:** Explicitly configured in OpenClaw under `tools.media.audio`.

## Cloud Fallbacks (Optional)

If higher accuracy, lower latency, or speaker diarization is required in the future, the skill supports cloud providers. These require API keys to be set in the environment:
- `OPENAI_API_KEY` (OpenAI Whisper API)
- `ASSEMBLYAI_API_KEY` (AssemblyAI for diarization)
- `DEEPGRAM_API_KEY` (Deepgram for real-time)

*Note: Cloud providers are currently optional and not active by default.*

## Common Workflows

### Audio Preprocessing (via `ffmpeg`)
- **Extract Audio:** `ffmpeg -i video.mp4 -vn -acodec pcm_s16le -ar 16000 -ac 1 audio.wav`
- **Reduce Noise:** `ffmpeg -i noisy.wav -af "afftdn=nf=-25" clean.wav`
- **Split Long Audio:** `ffmpeg -i long.mp3 -f segment -segment_time 600 -c copy chunk_%03d.mp3`

### Local Transcription
```bash
# Basic transcription
whisper audio.mp3 --model base --output_format txt
# With timestamps
whisper audio.mp3 --model medium --output_format srt
```
