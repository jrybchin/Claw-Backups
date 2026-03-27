# Documentation Rules

## Purpose
Create a durable documentation system that is transferable across AI agents, easy to maintain, and structured enough to preserve important logic without bloating normal interaction.

This document defines how project documentation should be written, organized, updated, and reused across Claw and future agent systems.

## Core Principles
- Documentation should preserve important logic, rules, decisions, and workflows.
- Documentation should be structured so it can transfer across models, agents, providers, and accounts.
- Documentation should support strong internal reasoning without forcing bloated user-facing replies.
- Durable guidance should live in organized docs, not be left scattered across chat history.
- Documents should work together as part of one coordinated system.
- Documentation should reduce the amount of manual reconstruction the user has to do after failures or interruptions.
- When new relevant information is introduced, update the affected Claw docs rather than treating it as a one-off future preference.
- Record meaningful changes in a way that helps future recovery and system continuity.
- Treat Claw Plan and the dynamic Logic layer as central alignment docs that should stay especially current.

## Central Alignment Maintenance Rules
- Claw Plan alignment with current logic should be a standing maintenance expectation, not a rare cleanup event.
- The dynamic Logic layer should be a standing central alignment layer that is updated whenever relevant system logic changes.
- If major logic changes happen elsewhere, evaluate whether Claw Plan or the dynamic Logic layer should also be updated in the same flow.
- Avoid letting roadmap logic and central operating logic drift away from the real system state.

## Proactive Update Behavior Rules
- When important logic changes, proactively update more of the relevant docs rather than waiting for explicit follow-up requests.
- Do not stop at the first obvious document if related central, live, or recovery docs should also reflect the change.
- Use document role classification to decide how broadly the change should propagate.
- Prefer finishing the full relevant documentation chain before reporting completion on system-building tasks.
- If a change affects Claw Plan, dynamic logic, live status, recovery behavior, or Codex continuity, assume a broader update may be needed.
- The goal is to reduce partial updates, stale adjacent docs, and unnecessary back-and-forth.

## Document Role Classification Rules
Claw documents are divided into these primary roles:
- **Live** — current working docs that should be updated often during active system work
- **Dynamic** — always-running background logic that should actively shape behavior even when not being rewritten
- **Acute** — important current explanatory logic that may be revised intentionally but is not as constantly active as the dynamic layer
- **Static** — important stored systems/instructions that matter when invoked but are not always-running logic
- **Reference** — historical or mostly stable information
- **Navigation** — human-facing table-of-contents docs

### Maintenance meaning
- **Live** docs should be updated frequently during active system-building work.
- **Dynamic** docs should be actively used in reasoning, responses, research, and system behavior.
- **Acute** docs should stay aligned and useful but do not need to run as constantly in the background.
- **Static** docs should remain available and accurate, but usually do not need frequent edits.
- **Reference** docs should be updated when meaningful lessons, repairs, or durable context emerge.
- **Navigation** docs should only change when needed to keep folder navigation accurate.

## Learning & Corrections Rules
- Claw should learn from explicit corrections, repeated preferences, and reusable self-reflection.
- These learning signals should be integrated into the existing Claw docs rather than creating a second competing memory authority.
- Promote repeated, reusable lessons into the right docs instead of leaving them as isolated one-off notes.
- Avoid overlearning from one-time instructions, silence, or narrow context-specific signals.

## Transferability Rules
- Prefer reusable wording over platform-specific wording where possible.
- Write rules so they can be copied into other agent systems with minimal editing.
- Treat major docs as master references that can serve as a through-line across multiple AI assistants.
- Preserve logic and nuance when making docs more compact or easier to skim.
- Organize docs so migration to another account, provider, or AI stack is easier.

## Accuracy & Source Preservation Rules
- Documentation should be grounded in the right raw sources when instructions or requirements matter.
- Summaries should improve readability without losing essential nuance.
- Important directions should not be simplified so much that they become wrong.
- When a rule comes from repeated real-world friction, capture the lesson clearly.
- Use documentation to reduce future hallucination, missed constraints, or repeated confusion.

## Documentation Sync Rules
- When a new rule, naming standard, structure, formatting standard, or system principle is introduced, identify which related docs are affected.
- Update the relevant docs so the system stays coherent.
- Treat the document set as a coordinated knowledge system, not isolated files.
- Propagate changes when doing so improves consistency, clarity, or correctness.
- Do not create unnecessary churn by rewriting unrelated documents.
- Keep terminology aligned across docs when the same concept appears in multiple places.
- If the user gives new relevant information, update the affected Claw documents in the same working flow whenever practical.
- Favor adding missing relevant logic over subtracting useful context unless a section is clearly redundant, misleading, or outdated.

## Local / Drive Mirror Rules
- The local Claw files should remain the main editable machine-facing source-of-truth layer most of the time.
- Mirrored Google Docs should remain aligned with the local files.
- Full sweeps should also check whether important Google Docs contain newer manual edits that should be synced back into the local Claw files.
- If meaningful manual Drive edits exist, sync them back into the corresponding local files so the two layers do not drift apart.
- Treat major sweeps as two-way consistency checks rather than only one-way local-to-Drive pushes.

## Codex Mirror Rules
- Maintain a curated Windows Codex mirror rather than a full raw clone of the entire Claw folder.
- Keep only the most important core, recovery, and high-value reference docs in the Codex mirror.
- Trigger an immediate Codex mirror sync after high-value changes.
- High-value changes include updates to Claw Plan, dynamic logic docs, live status docs, recovery docs, active tasks, and major continuity-relevant structure changes.
- Use a periodic scheduled sync as a backup layer in case immediate syncs are missed or manual edits occur outside the normal workflow.

## Index Rules
- Index documents should function primarily as table-of-contents navigation docs.
- Indexes should be human-facing and easy to scan quickly.
- Indexes should not be instruction-heavy.
- Indexes should cover only the documents in the same folder as the index.
- Indexes should not describe subfolders or documents inside subfolders.
- Each entry should mainly answer: what is this document, and what do its sections do?
- If a folder changes, its index should be updated to stay accurate.

## Continuity & Recovery Documentation Rules
- Important recovery logic should be documented before a crisis happens whenever possible.
- Documentation should help restore a known-good state quickly after failures.
- Keep recovery-oriented docs easy to find and easy to skim under stress.
- Preserve enough context that a backup agent or helper can diagnose the issue accurately.
- Use docs to reduce dependence on fragile memory or scattered chat history during recovery.

## Organization Rules
- Use the Claw folder as a durable long-term documentation home for project rules and planning docs in Drive.
- Use subfolders such as Features, Systems, and Logic to keep documents easy to browse.
- Store high-level plans, feature rules, and operating guidance in clearly named documents.
- Prefer a small number of strong, well-maintained docs over many vague or overlapping docs.
- Keep local workspace copies of important docs when useful for continuity and editing.
- Group multiple docs under a feature subfolder when they support one larger objective.

## Maintenance Rules
- Repeated problems should become written operating guidance.
- Important fixes should be documented soon after they are discovered.
- If a document becomes messy, reorganize it rather than letting it decay.
- Keep docs readable enough to review quickly.
- Update existing docs when a change belongs there instead of always creating a new doc.
- Distinguish between live docs, dynamic docs, acute docs, static/reference docs, and navigation docs.
- Give Claw Plan and the dynamic Logic layer dedicated passes during major sweeps.

## Response Simplicity Rules
- Advanced documentation logic should mostly operate in the background.
- User-facing replies should remain clean, direct, and proportionate.
- Documentation exists to improve outcomes, consistency, and recall — not to make interaction heavier.
- The system should feel sharper and more reliable, not slower and more cluttered.

## Current Status Notes
- Crash prevention documentation is still under active review and curation.
- Documentation rules should support feature development, roadmap updates, future cross-document syncing, continuity-oriented recordkeeping, two-way local/Drive synchronization during major sweeps, and Claw-native structured learning from corrections.
