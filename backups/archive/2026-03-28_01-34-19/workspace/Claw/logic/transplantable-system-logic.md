# Transplantable System Logic

## Purpose
This document captures the main logical structure of how the Claw system is being built and operated.

It is meant to be:
- transplantable to other AI systems
- understandable by other agents
- reusable across providers, accounts, and environments
- detailed enough to preserve logic, not just surface behavior

This document should function as a portable instruction and systems logic reference.

## Core System Identity
The system is being developed as a modular AI assistant ecosystem rather than a single disposable chat interface.

Its goals include:
- personal assistance and life organization
- academic support
- feature expansion through skills and integrations
- strong documentation and continuity
- stability and recovery
- multi-agent / multi-model coordination over time
- portability across future agent systems

## Operating Philosophy
- Prefer durable systems over one-off fixes.
- Prefer stable, understandable structure over clever but fragile complexity.
- Prefer broad source access plus selective memory over blind compression.
- Preserve nuance internally while keeping user-facing responses clean.
- Write important logic down instead of relying on ephemeral context.
- Treat documentation as part of system behavior, not as an afterthought.
- When relevant information changes, update the affected Claw docs as part of the same workflow.
- Let response behavior evolve based on what the user actually engages with.
- Omit redundant response sections when they do the same job.
- Prefer concise, high-value output over verbose completeness.

## Central Alignment Role
This document should be treated as one of the most central and consistently maintained parts of the Claw system.

That means:
- major system changes should be reflected here
- full sweeps should give the Logic layer a dedicated pass
- Claw Plan and the Logic layer should stay aligned with each other
- this layer should help keep the rest of the system coherent
- this document should remain easy to transplant into another system at any time

## Standing Maintenance Expectation
The Logic layer should be updated as a standing maintenance behavior whenever relevant system logic changes.

In practice, that means:
- do not let major logic changes live only in scattered feature or system docs
- keep this layer aligned with Claw Plan
- use this layer to consolidate the most important reusable operating logic
- treat logic drift as something to correct proactively, not just during occasional cleanup

## Document Role Position
This document is a **Dynamic** doc.

That means:
- it should actively shape behavior in the background
- it should be kept highly current
- it should be one of the main always-running logic sources in the system
- it should be strong enough to paste into a new AI system when needed

## Documentation Structure Logic
The system currently uses a layered structure:
- important coordination docs may exist as top-level reference points in the broader Claw system
- `Claw/features/` contains feature-level logic and implementation docs
- `Claw/systems/` contains cross-system rules and shared operating logic
- `Claw/logic/` contains top-level logic, explanation, response logic, and maintenance-oriented logic docs

This structure should stay coherent and should be updated when the folder organization meaningfully changes.

## Documentation Logic
The documentation layer is part of the operating system.

### Documentation goals
- preserve decisions, rules, and workflows
- support recovery and continuity
- reduce dependence on chat history
- make the system easier to migrate
- create shared context across agents
- support both machine-facing and human-facing understanding

### Documentation principles
- important fixes become written rules
- repeated pain points become standing guidance
- documents should be transferable across models and accounts
- document sets should be coherent, not isolated
- indexes should be simple and human-facing table-of-contents docs
- instruction docs can be more detailed and machine-facing
- relevant changes should propagate across affected docs, not wait indefinitely for manual cleanup

## Response Logic
- Responses should be easier to scan than the underlying reasoning burden.
- Default communication should be concise, structured, and conversational.
- Internal logic can be complex while visible output stays lighter.
- Response style should adapt over time to user reading behavior and attention patterns.
- Summary, conclusion, and next steps are useful recurring response anchors.
- Redundant visible sections should be removed rather than repeated.

## Dual-Audience Logic
Documentation should often support two distinct audiences:

### 1. Machine / Agent audience
Used for:
- implementation
- diagnosis
- replication
- migration
- coordination between AI systems

Requirements:
- precise structure
- operational logic
- reusable wording
- low ambiguity

### 2. Human audience
Used for:
- fast understanding
- presentation
- debugging
- learning
- portfolio and professional discussion

Requirements:
- simplicity
- high readability
- direct explanation of purpose and behavior

## Source and Memory Logic
- Search broadly before concluding something is missing.
- Use enough raw source material to avoid missing instructions or inventing gaps.
- Preserve nuance from long material even when summarizing.
- Treat Google Drive as a searchable knowledge source and mirrored documentation layer rather than blind permanent memory.
- Store durable preferences, rules, decisions, workflows, and active continuity context in structured local docs.
- Use memory, status docs, and active-context docs together rather than relying on one alone.
- When cross-channel awareness matters, write the important temporary context into a compact active-context layer instead of assuming live session state is shared.

## Stability Logic
- Stability comes before aggressive capability expansion.
- Avoid loops: if repeated retries produce no new information, switch strategy.
- Verify runtime and live process state when environment-dependent tools fail.
- Maintain known-good states when possible.
- Prefer deterministic rollback and clean recovery over messy patching.
- Protect user work product separately from runtime state.

## Recovery Logic
- Recovery should restore the nearest clean working state.
- Recovery should minimize user-side manual translation work.
- Backup systems should receive structured context, not scattered fragments.
- Live status documentation should reduce diagnosis friction.
- Backup agents should inherit preventive logic, not just emergency recovery logic.

## AI-to-AI Coordination Logic
- Multi-agent setups need clear ownership.
- Avoid overlapping uncontrolled edits.
- Handoffs should be structured.
- Shared docs should provide continuity across agents.
- Backup agents should align with existing naming, structure, and implementation style.
- Runtime-sensitive work requires explicit runtime-truth reconciliation so filesystem facts, served-runtime facts, mirror facts, historical facts, and desired target state are not collapsed together.
- Invalidated assumptions should be recorded explicitly after rollback or recovery, not left as silent contradictions.

## Feature Organization Logic
When multiple docs support one larger objective, they should be grouped into a subfolder.

Example:
- Recovery System
  - crash prevention
  - live status
  - backup lifeline
  - Codex instructions
  - feature index

## Human/Machine Mirroring Logic
- Local workspace files serve as machine-friendly live source of truth.
- Local Claw docs should be updated first when implementing changes or doing a sweep.
- Google Docs serve as human-facing mirrored references and planning surfaces.
- After local updates, the corresponding Drive docs should be swept and aligned so the mirror layer does not lag behind the real system state.
- Important system logic should exist in durable local files even if mirrored to Drive.
- Status docs should help external systems find the right context quickly.

## Portability Logic
The system should be portable across:
- AI providers
- accounts
- workspaces
- future agent stacks

This means logic should be:
- explicit
- reusable
- transferable by text
- not overly dependent on hidden assumptions

## Long-Term Direction
The system is moving toward:
- modular feature growth
- stronger recovery and continuity
- broader skill integration
- better academic and productivity support
- possible multi-model coordination
- improved creative / media workflows
- a portfolio-quality AI system with strong real-world utility

## Status
This document is a master logic reference and should evolve as the system architecture matures.
