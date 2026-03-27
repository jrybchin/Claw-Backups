# Claw Plan

## Purpose
This is the master roadmap for the Claw system.

Its job is to stay aligned with the actual logic, structure, priorities, and architecture of the Claw documentation system as it evolves.

This document should not drift into being a vague vision-only doc. It should reflect:
- what Claw is trying to become
- what has already been built
- what is actively being worked on
- what should happen next
- how the current system is organized

---

## Core Vision
Claw is being built as a modular AI assistant ecosystem rather than a simple chatbot.

The system is meant to support:
- personal assistance and life organization
- academic support
- feature growth through integrations and skills
- strong documentation and continuity
- stability, recovery, and backup support
- multi-agent / multi-model coordination over time
- portability across future AI systems
- professional and portfolio value

---

## Current System Priorities
The current priority order is:

1. **Keep the system stable and coherent**
2. **Build stronger documentation and continuity**
3. **Improve recovery and backup workflows**
4. **Strengthen memory and source handling**
5. **Improve shared logic across agents and systems**
6. **Expand capabilities more carefully after the foundation is solid**

This means Claw is currently in a **foundation and architecture phase**, not a heavy feature-expansion phase.

---

## Current System Architecture
The Claw system now has several major documentation layers.

### 1. Features
Feature docs explain specific systems or integrations.

Current feature areas include:
- **Recovery System**
- **GOG**

### 2. Systems
System docs capture cross-cutting operating rules.

Current system areas include:
- documentation rules
- memory and source-handling rules
- memory backup and update rules
- Drive live sync rules
- multi-agent coordination continuity

### 3. Logic
Logic docs explain the system at a big-picture level.

Current logic areas include:
- machine-facing transferable logic
- human-facing system explanation
- response logic
- active task tracking
- full-sweep maintenance prompt

### 4. Drive Mirror Layer
Google Docs in the Claw Drive structure act as human-facing mirrored references for planning, review, portability, and continuity.

### 5. Local Source-of-Truth Layer
Local files in the workspace act as the machine-friendly editable source of truth for system logic and documentation.

---

## Current Built Systems
The following things are meaningfully established now:

### Recovery System
This includes:
- crash prevention and fail-safe logic
- live system status tracking
- Codex backup lifeline workflow
- Codex recovery agent instructions
- recovery system indexing

### GOG Integration
This includes:
- Gmail search capability
- Google Docs creation and writing
- Drive search and organization
- a repair log documenting the key environment/runtime fix

### Logic Layer
This includes:
- transplantable system logic
- human system explanation
- response logic
- indexes structured for fast human scanning

### Documentation Framework
This includes:
- documentation sync rules
- table-of-contents style index rules
- transferability logic
- continuity-oriented documentation behavior
- a memory backup/update system for post-implementation continuity
- a narrow backend Drive live-sync layer for current-state tracking

### Multi-Agent Coordination Layer
This includes:
- explicit agent roster and routing logic
- shared live state
- shared recovery brief / handoff structure
- provider-auth tracking
- future fallback and overflow agent coordination

---

## Current Active Work
These are the main things still being actively worked on:

### 1. Claw Plan Alignment
This roadmap needs to remain aligned with the actual system logic and should receive periodic dedicated passes.

### 2. Crash Prevention & Fail-Safe Curation
This is still one of the most important unfinished logic sources and remains under active refinement.

### 3. Document Role Classification
The system still needs a clearer classification of documents into:
- live
- logic
- reference
- navigation

This matters because it affects update frequency, scope, and documentation discipline.

### 4. Memory and Source Handling
This should be worked on before broader response-logic expansion.

The main goal is to make Claw better at:
- broad source discovery
- preserving nuance from raw materials
- reducing missed instructions
- using Drive/docs as knowledge sources without turning them into noisy memory dumps

### 5. Codex Connection and Shared Context
The recovery docs exist, but the actual operational bridge to Codex is still incomplete.

What is still needed:
- a better shared-access model
- a clearer live context path for Codex
- a more direct handoff workflow
- possibly a persistent Codex session with access to the same workspace/docs
- finishing the implementation of the GPT 5.3 backup / fallback bot for rate limits and context-window pressure

### 6. Memory Backup & Update System
The system now needs a stronger always-on pattern for updating memory, live/current docs, Drive mirrors, and backup continuity after meaningful implementation work.

The goal is to make feature completion automatically produce usable continuity instead of leaving progress stranded in chat or only partially documented.

---

## Current Priority Queue
The strongest near-term order is:

1. **Dedicated Claw Plan sync and maintenance**
2. **Memory backup / update system refinement and frequent-update file discipline**
3. **Document role classification**
4. **Memory and source-handling work**
5. **Codex shared-access / connection design plus finishing the GPT 5.3 backup bot path**
6. **Further response-logic refinement only after the above is cleaner**

Lower priority for now:
- feature lifecycle design
- broader expansion planning
- aggressive new feature growth

---

## Possible Future Features
Possible future additions include:
- stronger multi-model coordination
- richer creative / presentation workflows
- ELMS/Canvas integration
- more modular agent/channel architecture
- quicker integrated speech-to-text workflows for easier capture, interaction, and mobile use

---

## Design Principles That Should Stay Constant
Claw should continue to follow these principles:
- stability before aggressive expansion
- broad source access with selective durable memory
- strong documentation as part of system behavior
- machine-facing and human-facing docs serving different roles
- concise user-facing replies with richer internal logic
- proactive internal checking before asking the user to do manual troubleshooting
- consistent cross-document syncing when relevant information changes
- cleaner multi-agent coordination
- portability to future AI systems

---

## What Is Still Not Mature Yet
The following areas exist conceptually but are not fully mature:

- fully operational Codex live bridge
- document role classification framework
- mature memory/source-handling system architecture
- mature response-type system
- ELMS/Canvas integration
- broader modular agent/channel architecture

---

## How This Plan Should Be Used
Use this document to:
- understand the current roadmap
- see what is built vs unfinished
- keep system priorities aligned
- prevent roadmap drift from the actual Claw architecture
- guide future dedicated roadmap sync passes

---

## Maintenance Rule
This document should be updated whenever:
- major system architecture changes happen
- priority order changes
- major feature clusters are added or reorganized
- the logic layer changes enough that the roadmap should catch up
- a full sweep identifies drift between plan and actual system state

---

## Status
This roadmap is active and should remain tightly aligned with the actual Claw system rather than drifting into a detached vision document.

