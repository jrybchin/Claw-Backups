# Speech-to-Text Skill Comparison

## Purpose
Compare leading speech-to-text skills discovered through Clawdhub and choose the best fit for this Claw setup.

## Evaluation Criteria
- accuracy
- speed
- cost effectiveness
- horizontal integration
- setup burden
- privacy / local-first flexibility

## Skills Compared
1. `speech-to-text`
2. `speech-to-text-transcription`
3. `elevenlabs-stt`

## 1. speech-to-text
### Model / backend
- inference.sh CLI (`infsh`)
- Whisper-family hosted models

### Strengths
- strong raw transcription focus
- multi-language
- timestamps
- translation support
- likely good accuracy/speed balance through hosted Whisper variants

### Weaknesses
- requires separate `infsh` CLI install and login
- more vendor-specific than needed
- less clear general workflow guidance than the best alternative
- horizontal integration is decent, but mostly within inference.sh ecosystem

### Cost profile
- likely usage-based hosted cost
- not clearly local-first

### Fit for this setup
- workable, but adds another toolchain and auth surface
- not the cleanest choice for a general Claw system

## 2. speech-to-text-transcription
### Model / backend
- multi-provider wrapper/guide
- supports local Whisper, OpenAI Whisper API, AssemblyAI, Deepgram
- requires `ffmpeg`

### Strengths
- best horizontal integration by far
- supports both local and cloud paths
- can optimize for privacy, speed, accuracy, or diarization based on task
- strongest operational guidance for real-world transcription workflows
- handles long audio, preprocessing, splitting, and output formats
- best cost flexibility because local Whisper is available
- strongest fit for a modular Claw system that may evolve later

### Weaknesses
- not turnkey out of the box
- requires `ffmpeg`
- local Whisper path may also require Python/pip setup if chosen
- more complex than a single-provider skill

### Cost profile
- best overall flexibility
- free/local path available
- can selectively use paid APIs only when higher quality or diarization is needed

### Fit for this setup
- best overall match
- fits the system’s preference for modularity, optionality, and future expansion
- gives the most room to optimize across speed / accuracy / cost depending on task

## 3. elevenlabs-stt
### Model / backend
- ElevenLabs Scribe v2 API
- uses curl + `ELEVENLABS_API_KEY`

### Strengths
- simple setup if API key already exists
- speaker diarization support
- likely strong quality
- clean direct script-based interface

### Weaknesses
- fully cloud/API dependent
- always paid / external-service oriented
- less flexible than a multi-provider skill
- weaker cost control than local/mixed options
- less horizontally integrated than the multi-provider option

### Cost profile
- paid API path
- no local fallback

### Fit for this setup
- good if ElevenLabs is already a central part of the stack
- not the best general-purpose system default

## Ranking
### Best overall fit
1. `speech-to-text-transcription`

### Best for easiest hosted Whisper-style use
2. `speech-to-text`

### Best if already committed to ElevenLabs
3. `elevenlabs-stt`

## Recommendation
The best speech-to-text skill for this setup is:
- `speech-to-text-transcription`

Why:
- best balance across accuracy, speed, cost effectiveness, and horizontal integration
- supports local-first workflows and paid higher-end workflows
- fits Claw’s modular architecture better than a single-provider skill
- scales better as the system grows

## Workspace State
- The initially installed `speech-to-text` skill was removed to avoid bloat before committing to the right choice.
- No speech-to-text skill is currently installed.

## Outcome
- `speech-to-text-transcription` was chosen and installed.
- The less suitable initially tested `speech-to-text` skill was removed to avoid bloat.
- Local execution was implemented with a lighter `faster-whisper` backend rather than the heavier Torch-based OpenAI Whisper Python path.

## Best Next Step
- Validate Telegram voice-note transcription end to end after the gateway reloads the explicit local `tools.media.audio` config.
- Keep cloud providers optional for future cases that need diarization, lower latency, or higher hosted accuracy.
