# Long-Term Memory & Crystallized Patterns

## Purpose
This file contains the distilled, long-term wisdom of the Openclaw system. It is curated from daily logs and active state. It holds rules, preferences, recurring structures, important lessons, and lasting project directions. It is not a raw transcript.

## Core System Understanding
- **What Claw IS:** A modular AI system and personal operating layer for Jacob. It serves as a productivity assistant, academic support tool, documentation/recovery system, portfolio project, and eventually a multi-agent/multi-model ecosystem.
- **Mission Control:** The non-developer-friendly control surface for creating tools on the fly and orchestrating system capabilities. It is a separate sidecar app on `http://127.0.0.1:3001/`, NOT embedded in the OpenClaw UI.

## Jacob's Behavioral Rules & Preferences
- **Execution:** Finish dependency chains before reporting back; don't stop one step early. Do everything that can reasonably be done automatically before coming back. Only ask the user for things that truly require their action, credentials, or approval.
- **Autonomy:** When the user describes goals/outcomes, the agent should take liberty with design and implementation details unless explicitly asked to intervene.
- **Documentation:** When a feature is finished, auto-update relevant local docs AND mirror to Drive. Keep indexes concise, human-facing, and section-oriented (for navigation, not instruction). Keep the system aligned with current logic as ongoing maintenance.
- **Research:** Broad source capture is strongly preferred for assignments, teacher directions, and hidden course materials so important constraints are not missed.
- **Continuity:** Telegram-facing behavior should stay in sync with the system-building context. Cross-session awareness must be written into memory/status docs.
- **Development:** Never treat direct compiled-bundle UI patching as a normal dev path. Prefer source-level integration, isolated sidecars, and recovery-safe rollback checkpoints.

## Notable Prior Work & Lessons Learned
- **GOG Repair:** GOG was repaired after diagnosing that `GOG_KEYRING_PASSWORD` existed in the shell but not the OpenClaw systemd user service environment; adding a systemd override and restarting fixed Gmail/Docs workflows.
- **Mission Control Failure:** A historical Mission Control attempt patched the OpenClaw control-ui compiled bundle directly, but that approach later proved brittle and caused a blank-black-screen failure. The strategy changed to a rollback-safe bundle plus an isolated sidecar.
- **Codex Backup:** A Codex recovery skill and Codex mirror workflow were set up so Codex can act as a backup recovery agent using mirrored Claw docs.

## Crystallized Patterns
*(Patterns that have become strong enough to deserve reusable artifacts, templates, workflows, or standing affordances.)*
- **Artifact Generation:** Approved crystallization generates an artifact-library entry, a human-readable crystallized-patterns document entry, and propagated system-state updates. Future artifacts may expand into Mission Control affordances, response templates, planning templates, retrieval presets, and workflow templates.
- *(No specific patterns crystallized yet, pending first propagation run.)*
