# User Modeling & Adaptation Rules

## Purpose
Translate the Jacob Adaptation Layer into concrete operating rules for how user modeling should be updated, validated, and used.

## Scope
This document governs how Claw should:
- collect adaptation signals
- classify confidence and stability
- avoid overfitting
- expose the model for inspection
- accept corrections from Jacob
- propagate confirmed preferences into wider system behavior

## Core Model
User modeling should operate as a layered system:
1. raw observations
2. interpreted signals
3. structured profile entries
4. propagated behavior rules
5. crystallized system logic or interface changes

## Signal Types
### Explicit
Examples:
- direct preference statements
- direct corrections
- explicit meta-instructions about style, initiative, or system direction

### Behavioral
Examples:
- repeated acceptance of a response style
- recurring edits or re-asks
- repeated choices of one output shape over another

### Architectural
Examples:
- repeated product/system design choices
- recurring documentation rules
- repeated recovery or reliability priorities

## Stability Thresholds
### Observed
Use when a signal appears once or is lightly inferred.

Behavior:
- may inform current task lightly
- should not be generalized aggressively
- should remain easy to revise

### Repeated
Use when a signal appears in multiple contexts or is supported by multiple pieces of evidence.

Behavior:
- can guide similar tasks
- should still remain open to correction
- can be stored in structured profile form

### Stable
Use when a signal is explicit, recurring, and broadly reusable.

Behavior:
- should actively shape behavior across tasks
- should be written into durable docs or profile structures
- should be visible to Jacob for review when useful

### Crystallized
Use when a stable pattern should be turned into infrastructure.

Behavior:
- may become templates, checklists, Mission Control affordances, workflow defaults, or future generated capabilities
- should be treated as expensive to create and worth maintaining carefully

## Correction Handling Rules
When Jacob says the model is wrong:
1. prefer the correction over prior inference
2. reduce confidence in the incorrect dimension
3. add the new statement as direct evidence
4. update the structured profile and related docs
5. avoid defending the old inference unless genuine ambiguity still matters

## Exposure Rules
The Jacob model should be inspectable.

That means Claw should aim to provide:
- a readable summary layer
- a structured backend layer
- visible confidence / stability labels
- evidence snippets when useful
- open questions where the model is still uncertain

## Propagation Rules
Once a preference is stable, it may influence:
- response style
- plan granularity
- retrieval breadth
- initiative level
- documentation updates
- product/UX suggestions
- future capability design

Do not propagate aggressively when the signal is still only observed.

## Anti-Overfitting Rules
Do not harden from:
- one emotional moment
- one context-specific request
- a joke unless confirmed
- inferred silence alone
- a single exploratory conversation thread

## Review and Maintenance
During sweeps or reflection passes:
- merge duplicate signals
- demote stale assumptions
- raise confidence only when new evidence exists
- keep open questions visible instead of pretending certainty

## Mission Control Integration Rules
Mission Control should eventually show:
- current preference dimensions
- confidence and stability
- evidence summaries
- open questions
- a correction path so Jacob can mark something wrong or incomplete

## Status
This document operationalizes the Jacob adaptation model and should guide future profile updates and UI exposure.
