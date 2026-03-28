# Learning & Corrections System

## Purpose
Integrate correction-learning, self-reflection, and promotion ideas into the existing Claw architecture without creating a second competing memory system.

This system is meant to make Claw improve over time in a structured, Claw-native way.

## Core Principle
Claw should learn from:
- explicit user corrections
- repeated user preferences
- reusable self-reflection after meaningful work
- repeated successful workflows

But it should do this inside the existing Claw documentation structure, not through a separate parallel memory universe.

## What This System Adapts
This system borrows these ideas:
- correction logging
- self-reflection after significant work
- promotion of repeated lessons
- scoped storage by context
- compaction without blind deletion

It does **not** adopt a separate standalone `~/self-improving/` authority as the primary memory system.

## What Counts as a Learning Signal
### Explicit corrections
Examples:
- that’s wrong
- stop doing that
- I prefer X
- always do Y
- why do you keep doing Z

### Strong preference signals
Examples:
- I like when you...
- always do X for me
- never do Y
- my style is...
- for this project, use...

### Repeated workflow patterns
- same instruction repeated multiple times
- same successful workflow used repeatedly
- same structural preference recurring across tasks

### Self-reflection signals
After meaningful work, Claw should sometimes evaluate:
- what was off
- what could improve next time
- whether the lesson is reusable beyond this one task

## What Should Not Be Learned Too Aggressively
Do not promote too quickly from:
- one-time instructions
- purely local/context-specific instructions
- hypotheticals
- silence alone
- ambiguous inferred preferences

## Storage Model Inside Claw
### Dynamic layer
Use Dynamic docs for always-running background logic.

Examples:
- Transplantable System Logic
- Response Logic
- Documentation Rules
- Memory & Source Handling Rules
- Crash Prevention & Fail-Safe Checklist

### Live layer
Use Live docs for current active priorities and current-state coordination.

Examples:
- Claw Plan
- Active Tasks List
- Live System Status Report

### Reference layer
Use Reference docs for repair history, durable historical lessons, and supporting continuity.

### Scoped feature/system docs
Use feature docs or system docs when a lesson belongs to a specific subsystem rather than the entire Claw system.

## Promotion Rules
Promote a lesson into stronger system logic when:
- it recurs multiple times
- it is explicitly important to the user
- it is clearly reusable across tasks
- it improves system quality beyond one narrow context

### Promotion targets
- global reusable behavior → Dynamic docs
- current system priorities → Live docs
- subsystem-specific pattern → feature or system doc
- durable historical lesson → Reference doc

## Self-Reflection Rules
After meaningful work, Claw may reflect on:
- what the task required
- what was learned
- what should be done differently next time
- whether the lesson is global, scoped, or temporary

This reflection should mostly improve internal system behavior and documentation quality rather than cluttering normal chat.

## Conflict Resolution
When lessons or preferences conflict:
- more specific wins over more general
- more recent wins at the same level
- if still ambiguous, ask the user

## Compaction Rules
When learning becomes noisy:
- merge similar lessons
- summarize repeated patterns into stronger rules
- demote or archive low-value older material
- do not blindly delete useful confirmed preferences

## Relationship To Existing Docs
This system should work closely with:
- Documentation Rules
- Memory & Source Handling Rules
- Response Logic
- Crash Prevention & Fail-Safe Checklist
- Transplantable System Logic

## Operating Bias
Claw should become more correct and more tailored over time, but not through noisy overlearning.

The goal is:
- structured improvement
- cleaner promotion of lessons
- better reuse of corrections
- stronger long-term system quality

## Status
This is the Claw-native adaptation of the correction / reflection / promotion model and should guide future learning behavior.
