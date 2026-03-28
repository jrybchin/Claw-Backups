# GOG Feature Overview

## Purpose
This feature area documents how the GOG CLI is being used inside the Claw system for Google Workspace tasks such as Gmail search and Google Docs creation/editing.

It also records the foundational setup issues, repairs, operating assumptions, and system role so future debugging and recovery are easier.

## What GOG Is Used For Right Now
Current known uses include:
- searching Gmail
- creating Google Docs
- writing/updating Google Docs
- moving docs into Drive folders
- searching Drive
- organizing project documentation in Drive

## Why This Feature Matters
GOG is a foundational integration because it enables Claw to interact with the user’s Google ecosystem directly.

That includes:
- Gmail workflows
- Drive-based project memory and planning docs
- structured feature documentation in Google Docs
- future workflows involving school, projects, planning, and organization
- continuity between the local Claw files and the Drive mirror layer

## Current Account Context
- Primary account currently used: `jrybchin@terpmail.umd.edu`
- GOG access is currently working again after runtime/service environment fixes
- The current setup depends on the service environment being configured correctly, not just the shell environment

## Key Commands Used So Far
Examples of important command patterns used in this setup:
- Gmail search
- Docs create
- Docs write
- Drive search
- Drive move
- Drive mkdir

Representative examples:
- `gog gmail search 'from:(umd.edu OR @umd.edu) newer_than:7d' --account jrybchin@terpmail.umd.edu`
- `gog docs create 'Document Title' --account jrybchin@terpmail.umd.edu`
- `gog docs write <docId> --file <path> --account jrybchin@terpmail.umd.edu`
- `gog drive move <fileId> --parent <folderId> --account jrybchin@terpmail.umd.edu`

## Important Operational Notes
- GOG requires the correct account context.
- GOG token access depends on the runtime environment being configured correctly.
- For this setup, the key blocker was not the Gmail query itself, but the environment available to the OpenClaw service.
- Google Docs have become a major human-facing mirror for the local Claw documentation system.
- GOG is part of the continuity layer of the system because many docs are mirrored into Drive.
- Manual edits in important Drive docs may need to be synchronized back into local Claw files during major sweeps.

## Current Role in the System
GOG is currently the bridge between:
- local Claw documentation
- Google Drive folders
- Google Docs as user-visible planning/reference docs
- Gmail search and email-related workflows
- future cross-agent continuity where shared docs matter

## Documentation Notes
- This feature should be updated when major GOG repair lessons, new workflows, or important operational assumptions emerge.
- Small day-to-day usage does not need to be logged unless it reveals a durable lesson.
- Repair history should be preserved separately from the high-level feature overview.
- Because GOG supports the Drive mirror layer, it indirectly supports both Claw Plan alignment and Logic-layer continuity.

## Status
This feature is active and foundational.
