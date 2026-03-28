# Memory, Learning & Adaptation System

## Purpose
This document defines how the Openclaw system handles memory storage, access, recall, and self-improvement. The system is designed to be a **Self-Improving + Proactive Agent**. It evaluates its own work, catches mistakes, and improves permanently so knowledge compounds over time without manual maintenance.

## 1. Tiered Memory Architecture

The memory system uses a strict tiered structure to balance context limits, relevance, and long-term durability.

### HOT Tier (Always Loaded)
- **Location:** `MEMORY.md` and `IDENTITY/USER.md`
- **Size Limit:** ≤ 100 lines.
- **Content:** Global preferences, crystallized rules, and active core truths.
- **Behavior:** Always loaded into the agent's context on session start.

### WARM Tier (Load on Demand)
- **Location:** `domains/` (e.g., code, writing) and `projects/` (e.g., specific school classes or coding projects).
- **Size Limit:** ≤ 200 lines per file.
- **Content:** Domain-specific or project-specific patterns and rules.
- **Behavior:** Loaded only when the context matches the domain or project.

### COLD Tier (Archived)
- **Location:** `archive/`
- **Size Limit:** Unlimited.
- **Content:** Decayed, inactive, or deprecated patterns.
- **Behavior:** Loaded only on explicit query (e.g., "What did we used to do for X?").

### LOGS Tier (Learning Signals)
- **Location:** `corrections.md` and `reflections.md` (stored in `daily-logs/` or root).
- **Content:** The last 50 corrections and self-reflection entries.

## 2. Learning Mechanics & Signals

The system does not just record data; it actively learns from specific signals.

### What Triggers Learning
| Trigger | Confidence | Action |
|---------|------------|--------|
| "No, do X instead" | High | Log correction immediately |
| "I told you before..." | High | Flag as repeated, bump priority |
| "Always/Never do X" | Confirmed | Promote to preference |
| User edits your output | Medium | Log as tentative pattern |
| Same correction 3x | Confirmed | Ask to make permanent |
| "For this project..." | Scoped | Write to project namespace |

### What Does NOT Trigger Learning
- Silence (not confirmation)
- Single instance of anything
- Hypothetical discussions
- Third-party preferences ("John likes...")
- Implied preferences (never infer)

### Correction Classification
- **Format:** "Use bullets not prose" -> global
- **Technical:** "SQLite not Postgres" -> domain/code
- **Communication:** "Shorter messages" -> global
- **Project-specific:** "This repo uses Tailwind" -> projects/{name}

### Self-Reflection Protocol
After completing significant work (a multi-step task, fixing a bug, or receiving feedback), the agent must pause and evaluate:
1. **Did it meet expectations?** (Outcome vs Intent)
2. **What could be better?** (Identify improvements)
3. **Is this a pattern?** (If yes, log to `reflections.md`)

**Log Format:**
```text
CONTEXT: [type of task]
REFLECTION: [what I noticed]
LESSON: [what to do differently]
```

## 3. Memory Operations

### Automatic Operations
- **On Session Start:** Load `MEMORY.md` (HOT). Check active tasks/state for context hints. Preload relevant WARM namespace if project detected.
- **On Correction Received:** Parse type. Check if duplicate. If new, add to `corrections.md`. If duplicate, bump counter. If counter >= 3, ask to confirm as rule. Write to appropriate namespace.
- **On Pattern Match:** When applying a learned pattern, cite the source: "Using X (from MEMORY.md:15)". Log usage for decay tracking.

### User Commands
- **"What do you know about X?"** -> Search all tiers, return matches with sources.
- **"Show my memory"** -> Display `MEMORY.md` contents.
- **"Show [project] patterns"** -> Load and display specific namespace.
- **"Forget X"** -> Remove from all tiers, confirm deletion.
- **"Memory status"** -> Show tier sizes, last compaction, health.

## 4. The Promotion, Demotion & Scaling Engine

Memory is dynamic. Patterns move between tiers based on usage and volume.

### Promotion Rules
- **Observed:** Seen once. Logged in `corrections.md` or `reflections.md`.
- **Repeated:** A pattern used or corrected 3 times successfully in 7 days → **Promote to HOT** (`MEMORY.md`) or **WARM** (specific project file).

### Demotion & Compaction Rules
- **Unused 30 days:** Demote from HOT to WARM.
- **Unused 90 days:** Archive from WARM to COLD.
- **Compaction:** When a file exceeds its line limit:
  1. Merge similar corrections into a single rule.
  2. Summarize verbose entries.
  3. Archive unused patterns with context.
  4. *Never delete confirmed preferences without asking.*

### Volume Thresholds & Splitting
- **<100 entries:** Single `MEMORY.md`, no namespacing.
- **100-500 entries:** Split into `domains/`, basic indexing.
- **500-2000 entries:** Full namespace hierarchy, aggressive compaction.
- **When to split:** Create a new namespace file when a single file exceeds 200 lines, a topic has 10+ distinct corrections, or the user explicitly separates contexts.

## 5. Conflict Resolution & Edge Cases

When patterns contradict, follow these resolution rules:

### Inheritance Chain
`global (MEMORY.md) -> domain (domains/code.md) -> project (projects/app.md)`

### Resolution Logic
1. **Specificity Wins:** Project > Domain > Global.
2. **Recency Wins:** If at the same level, the most recent rule wins.
3. **Ambiguity:** If ambiguous, ask Jacob ("Should this apply globally or just here?").

### Edge Cases
- **Contradiction Detected:** Log conflict in `corrections.md` and ask user to clarify scope.
- **User Changes Mind:** Archive old pattern with timestamp, add new pattern as tentative. Keep archived for reference.
- **Context Lost:** If agent loses context mid-session, re-read `MEMORY.md`, check state for relevant namespaces, load active project namespace, and continue.
- **Corruption Recovery:** If memory file corrupted, check `archive/` for recent backup, rebuild from `corrections.md`, and ask user to re-confirm critical preferences.

## 6. Transparency & Graceful Degradation
- **Cite Sources:** Every action from memory must cite its source.
- **Context Limits:** If the context limit is hit, load only `MEMORY.md` (HOT) and the most relevant WARM namespace. Never fail silently—tell Jacob what is not loaded.
- **Security Boundaries:** Never store credentials, health data, or third-party info in memory files.
