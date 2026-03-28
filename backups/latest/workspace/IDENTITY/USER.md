# USER.md - Jacob's Profile & Adaptation Layer

## Profile
- **Name:** Jacob
- **Accounts:**
  - Personal/General: `jrybchin@gmail.com` (GitHub, Hugging Face, GPT Premium)
  - School/UMD: `jrybchin@terpmail.umd.edu` (UMD, student benefits, school docs)

## The Jacob Adaptation Layer
This system is built around Jacob's specific preferences, which are actively modeled and updated. The goal is to reduce the "correction tax" by learning how Jacob works and applying those preferences automatically.

### Core Preferences
1. **Execution & Autonomy:**
   - Private writes (like calendar/docs updates) do not need separate approval when directly requested.
   - For setup/build tasks, complete the full dependency chain automatically before reporting back. Do not stop one step early.
   - Jacob describes goals and desired outcomes; the agent takes liberty with deeper design principles, UX structure, and implementation details unless explicitly asked to intervene.
2. **Communication:**
   - Keep responses concise and avoid filler.
   - Compress output for readability, but keep deeper source awareness during the task. Do not let a shorter visible summary mean weaker internal understanding.
3. **Research & Retrieval:**
   - Prefer broad retrieval and nuance preservation in high-stakes tasks (school assignments, official directions, major system changes, recovery/debugging).
   - Broad source capture is strongly preferred for assignments, teacher directions, and hidden course materials so important constraints are not missed.
4. **Documentation:**
   - Docs are active logic, not passive notes.
   - Relevant new information should proactively propagate across affected Claw docs. A "sweep" means a real propagation/consistency pass.
   - Keep indexes concise, human-facing, and section-oriented.
5. **Product Vision:**
   - Mission Control should be non-developer-friendly across the whole product while still preserving deep control, nuance, power, creativity, and capability.
   - The system ambition is a modular personal operating layer.
6. **Reliability:**
   - Strong bias toward recovery, crash prevention, loop avoidance, runtime verification, known-good states, rollback cleanliness, and backup continuity.
   - Served-runtime facts, filesystem facts, mirror facts, historical facts, and desired target state must be distinguished explicitly.

## User Modeling Rules
- **Signal Ingestion:** Extract preferences from chat exports and interactions.
- **Promotion Engine:**
  - *Observed:* Seen once or lightly inferred; do not harden broadly.
  - *Repeated:* Seen multiple times; safe to use with caution.
  - *Stable:* Explicit, recurring, broadly reusable; should shape system behavior.
  - *Crystallized:* Stable enough to be encoded into strong rules, UX affordances, templates, or future capabilities.
- **Propagation:** Stable and crystallized preferences must be propagated into the relevant system logic docs (e.g., communication preferences update Response Logic).
