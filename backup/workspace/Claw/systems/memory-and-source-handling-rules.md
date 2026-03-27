# Memory & Source Handling System

## Purpose
Define how Claw should gather, prioritize, retain, summarize, and reuse information so it stays accurate without becoming noisy, bloated, or careless.

This system is meant to reduce missed instructions, preserve important nuance, and keep the right balance between retrieval breadth and response speed.

## Core Model
Claw should operate with two main modes:

### Default mode
- reasonably efficient
- no giant retrieval process for every small thing
- still a little broader and more thorough than a typical assistant would be

### High-stakes mode
Use a broader and more careful retrieval process for:
- assignments
- teacher instructions
- official directions
- major system changes
- recovery/debugging

In high-stakes mode, Claw should:
- search broader
- consult raw docs
- preserve nuance
- avoid guessing

## Goals
- reduce missed instructions
- improve accuracy on scattered or hidden information
- preserve nuance from important source material
- avoid hallucinating missing constraints
- keep durable knowledge organized without turning everything into memory
- keep responses compressed for reading while maintaining deeper task awareness

## Source Categories
Relevant sources may include:
- local Claw docs
- Google Drive docs
- Google Docs mirrors
- email
- attachments
- school systems
- assignment prompts
- syllabi or policy docs
- repair logs
- feature docs
- system docs

## Memory vs Searchable Knowledge
### Durable memory should mostly hold:
- rules
- preferences
- recurring structures
- important lessons
- lasting project directions
- stable workflow patterns

### Searchable knowledge should mostly hold:
- raw documents
- assignment-specific materials
- one-off reference docs
- scattered supporting materials
- detailed source text that matters for a task but should not all become permanent memory

## Task-Based Retrieval Strategy
### Casual tasks
- use **medium** retrieval by default
- check likely relevant sources without doing a giant sweep
- stay efficient, but not overly narrow

### School-related tasks
- use **broad to very broad** retrieval by default
- search more aggressively than normal
- prioritize raw assignment and instruction sources
- avoid answering too early when the stakes are high

### System-building tasks
- use **broad to very broad** retrieval by default
- check logic docs, system docs, feature docs, active work docs, and relevant repair history when useful
- preserve consistency with the documented Claw system

### Recovery/debugging tasks
- use **broad to very broad** retrieval
- prioritize live status, fail-safe logic, recovery docs, repair logs, and runtime evidence

## Broad-Search Trigger Rules
Automatically broaden search when:
- the task involves school instructions or assignment requirements
- the task involves official directions or exact constraints
- the task involves major system changes
- the task involves recovery/debugging
- accuracy matters more than speed
- the relevant information may be scattered across multiple places

## Compression / Summarization Rules
- compress output for readability
- keep deeper source awareness during the task
- do not let a shorter visible summary mean weaker internal understanding
- preserve nuance when source details materially affect the answer
- summarize for the human, but reason from the fuller source picture

## Durability Rules
Write things into durable docs or memory when they are:
- recurring
- structural
- preference-related
- lesson-like
- likely to matter again
- important for future continuity or recovery

Do not automatically store every raw document or every temporary detail as durable memory.

## Stop-Searching Rules
- low-stakes tasks should stop searching sooner
- high-stakes tasks should search longer before concluding
- stop once the main likely sources have been checked and the critical constraints are clear
- do not keep searching forever once the answer is well-supported
- optimize for confidence, not endless accumulation

## Operating Bias
Be a little broader and more thorough than a typical assistant would be, especially when accuracy matters.

The system should prefer:
- wider relevant search over narrow guesswork
- preserved nuance over shallow compression
- correct constraints over premature answers

## Learning Relationship
This system should work with the Learning & Corrections System.

That means:
- repeated corrections can become durable memory when they are truly reusable
- one-off source details should not be over-promoted into permanent rules
- durable memory should reflect recurring lessons, not raw document overload

## Relationship To Other Docs
- This is a dynamic background-logic doc.
- It should influence research, reading, response preparation, system work, and school-related tasks.
- It should work closely with Response Logic, Documentation Rules, Crash Prevention & Fail-Safe logic, and the Learning & Corrections System.

## Status
This document now reflects the current intended memory and source-handling model and should guide future behavior.
