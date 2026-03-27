# Channel Continuity & Active Context Layer

## Purpose
Reduce loss of important context across channels, sessions, restarts, and parallel assistant surfaces such as Telegram.

This layer exists because live session context is not reliably shared across all active channels.

## Core Principle
If a channel-facing assistant needs to know something important, that context should exist in durable files rather than only in one live conversation.

## What This Layer Should Capture
Store short, high-signal current context such as:
- what is actively being built right now
- important temporary capabilities that are mid-rollout
- current known blockers
- active tests in progress
- what other channels should be aware of
- what not to say as if it were still true

## Relationship To Other Docs
This layer is lighter and more short-lived than long-term memory.

Use it alongside:
- `Live System Status Report` for broader system state
- `Active Tasks List` for focused work queue
- `memory/YYYY-MM-DD.md` for daily continuity notes
- `MEMORY.md` for longer-lasting durable rules and preferences

## Good Use Cases
Examples:
- Telegram-facing session should know STT is being actively set up
- another session should know a backup workflow was just repaired
- a restarted session should know the currently active feature rollout
- a channel bot should avoid claiming a feature is unavailable when it is mid-implementation and close to being testable

## Writing Rules
Keep this layer:
- concise
- current
- high-signal
- temporary when appropriate
- easy to skim quickly

Do not turn it into a giant long-term archive.

## Operational Rule
When a capability rollout, recovery effort, or high-impact system change is actively in progress, write a short active-context update so other sessions have a better chance of reconstructing the right state.

## Status
This doc defines the channel continuity layer and should inform future continuity behavior across Telegram and other session surfaces.
