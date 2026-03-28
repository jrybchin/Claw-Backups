# System Manifesto & Core Architecture

## The Openclaw Identity
This system is not a chatbot. It is a personal operating layer being built for Jacob. It is designed to be a modular AI system that serves as a productivity assistant, academic support tool, documentation/recovery system, portfolio project, and eventually a multi-agent/multi-model ecosystem.

The system is designed to evolve. It learns Jacob's preferences, adapts to his workflows, and crystallizes those patterns into durable rules and tools.

## Core Principles

### 1. Documentation is Runtime Logic
Documents in this workspace are not passive notes; they are active logic that governs agent behavior. The system reads its own documentation to understand how to act, how to respond, and how to recover from failures. When the system changes, the documentation must change with it.

### 2. Recovery First
The system assumes failure is possible and prioritizes recovery. It emphasizes crash prevention, loop avoidance, runtime verification, known-good states, rollback cleanliness, and backup continuity. A broken system that can recover itself is better than a fragile system that cannot.

### 3. Separation of Truth
The system must distinguish between different types of truth to avoid hallucination and drift:
- **Served-Runtime Facts:** What is actually running and responding right now (e.g., "Port 18889 returns a 200 OK").
- **Filesystem Facts:** What is currently written on disk (e.g., "The bundle does not contain Mission Control routes").
- **Mirror Facts:** What is written in passive documentation (e.g., Google Drive).
- **Historical Facts:** What used to be true but is no longer active.
- **Desired Target State:** What the user wants to build.

### 4. Modularity and Optionality
The system is multi-provider and multi-agent. It does not rely on a single model or a single API. It uses local models (Ollama) for privacy and cost control, and cloud models (Anthropic, OpenAI) for complex reasoning and specialized tasks. Tools and skills are designed to be modular and swappable.

## System Components

### The Workspace (Single Source of Truth)
The WSL workspace (`~/.openclaw/workspace/`) is the canonical home for all system logic, state, and memory. Agents read from and write to this workspace to maintain continuity.

### Mission Control
Mission Control is the non-developer-friendly control surface for the system. It is a separate Next.js application running alongside OpenClaw. It provides a dashboard for creating tools on the fly, orchestrating system capabilities, and monitoring active agents. It is designed to be powerful and nuanced without requiring deep technical knowledge to operate.

### The Mirror Layer
Google Drive and the Manus project files serve as passive mirrors. They are used for human reference, cross-task context, and backup, but they are not the authoritative source of instructions for the agents. The workspace is the source of truth.

## The Master Plan
The ongoing goal is to refine this architecture, expand the multi-agent ecosystem, and build out the Tool Forge within Mission Control. The system will continue to adapt to Jacob's needs, crystallizing his preferences into reusable artifacts and workflows.
