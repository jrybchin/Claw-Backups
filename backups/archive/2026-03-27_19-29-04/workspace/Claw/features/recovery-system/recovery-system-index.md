# Recovery System Index

## Folder purpose
Crash prevention, continuity, rollback, recovery, and Codex backup support.

## Table of contents

### 1. Live System Status Report
**Purpose:** Fast current-state snapshot for backup, continuity, and recovery.

**Sections:**
- **Purpose** — defines the doc as the first current-state read.
- **How to Use This Document** — explains when and why to read it first.
- **Current Timestamp** — marks when the status snapshot was last written.
- **Current Active Focus** — states what the system is actively working on.
- **Current High-Priority Docs** — lists the most relevant docs right now.
- **Current Working State** — separates what is stable, in progress, and not yet built.
- **Current Known Risks** — highlights the biggest current recovery or continuity risks.
- **Current Desired Direction** — summarizes the intended direction of the system.
- **Recommended Read Order for Backup Systems** — gives a fast recovery reading order.
- **Current Feature Architecture Direction** — explains how the feature docs are being organized.
- **If Failure Happens Right Now** — gives immediate recovery context.
- **Update Rule** — explains when this status doc should be refreshed.
- **Status Quality Rule** — defines how concise and high-signal the doc should stay.

### 2. Crash Prevention & Fail-Safe Checklist
**Purpose:** Main operating rules for preventing crashes, reducing loops, and recovering cleanly.

**Sections:**
- **Purpose** — defines the doc as the master fail-safe ruleset.
- **Meta Principles** — explains how these rules should operate in the background.
- **Loop Prevention Rules** — limits repeated failed retries.
- **User Time Protection Rules** — protects against slow, frustrating workflows.
- **Slow / Inefficient Workflow Rules** — reduces wasted effort and tool churn.
- **Crash Containment Rules** — keeps failures from spreading.
- **Runtime & Environment Verification Rules** — stresses checking live runtime state.
- **AI-to-AI Coordination Rules** — reduces multi-agent confusion.
- **Recovery, Continuity, and Safe Rollback Rules** — explains how to recover cleanly.
- **Residue Prevention Rules** — prevents broken leftovers after rollback.
- **Recovery & Escalation Rules** — explains what to do when initial fixes fail.
- **Lifeline / Backup Diagnosis Rules** — defines the backup-path logic.
- **Accuracy & Context Preservation Rules** — protects accuracy during troubleshooting.
- **Documentation & Transferability Rules** — explains how the logic should be reusable.
- **Response Simplicity Rules** — keeps the visible behavior lighter than the internal logic.
- **Current Use** — explains what this checklist is for right now.
- **Curation Status** — marks the doc as still under review.

### 3. Backup Lifeline: Codex Recovery Workflow
**Purpose:** Backup-path design for using Codex when Claw is degraded or unavailable.

**Sections:**
- **Purpose** — defines the doc as the Codex backup workflow.
- **Why This Exists** — explains the failure patterns it is meant to solve.
- **Design Goal** — explains what a good backup path should achieve.
- **Primary Model** — defines Claw, Codex, and user roles.
- **When to Use the Lifeline** — explains when this backup path should activate.
- **Handoff Requirements** — explains what Codex needs in a handoff.
- **Minimum Recovery Brief Template** — gives the structure of a proper handoff brief.
- **Recovery Philosophy** — explains the style of recovery this system wants.
- **Codex Coordination Rules** — defines how Codex should interact cleanly.
- **What the User Should Ideally Need To Do** — minimizes user-side labor.
- **Future Automation Goal: Active Bridge** — outlines the future Codex bridge idea.
- **Suggested Next Steps** — lists how this feature could mature.
- **Status** — marks the workflow as an active evolving concept.

### 4. Codex Recovery Agent Instructions
**Purpose:** Instructions for how Codex should read the docs, diagnose issues, and work in a stable style.

**Sections:**
- **Purpose** — defines Codex’s role in the system.
- **Primary Role** — explains that Codex is a backup agent, not a second uncontrolled primary.
- **First Files To Read** — gives Codex its read order.
- **Style and System Alignment** — explains how Codex should match existing structure and style.
- **Operating Principles** — defines general behavior expectations.
- **Preventive Stability Style** — extends crash-prevention logic into Codex’s coding style.
- **Recovery Priorities** — gives Codex a priority order during failures.
- **Ownership Rules** — reduces multi-agent overlap.
- **What Codex Should Look For** — lists key evidence Codex should inspect.
- **What Codex Should Avoid** — lists common failure behaviors to avoid.
- **Desired Output Style** — explains how Codex should communicate.
- **If Context Seems Incomplete** — explains how Codex should fill gaps carefully.
- **Long-Term Goal** — explains the intended future role of Codex.
- **Status** — marks the instructions as evolving.

## Notes
- This index only covers documents in the same folder.
- It does not describe subfolders or documents inside subfolders.
