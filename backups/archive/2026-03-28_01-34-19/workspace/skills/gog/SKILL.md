---
name: gog
description: Use the gog CLI for Google Workspace tasks including Gmail, Calendar, Drive, Sheets, Docs, and Slides. Trigger when the user wants to search/read email, inspect calendar events, search/read/download Drive files, inspect/export Docs, read/update Sheets, inspect Slides, or work with Google Workspace from a machine where the gog binary is installed and authenticated.
metadata: {"openclaw":{"emoji":"📬","requires":{"bins":["gog"]}}}
---

# GOG

Use the `gog` CLI for Gmail, Calendar, Drive, Sheets, Docs, and Slides.

## Rules

- Draft first before sending email.
- Ask before modifying Calendar, Sheets, Drive, Docs, or Slides.
- Prefer read-only commands first.

## Read-only examples

```bash
gog gmail search 'newer_than:7d' --max 10 --account you@example.com
gog calendar events --from today --to tomorrow --account you@example.com
gog drive search "query" --max 10 --account you@example.com
gog sheets get "Tab!A1:D10" --json --account you@example.com
```bash
ls ~/.openclaw/workspace/skills/gog

