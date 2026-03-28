# GOG Setup & Repair Log

## Purpose
Retroactive record of the major setup and repair steps that were needed to get GOG working reliably enough for Gmail search and Google Docs workflows inside Claw.

This document exists because the early setup happened before the current documentation system was fully in place.

## Timestamp
- Retroactive log created: 2026-03-26 18:47 EDT

## Initial Problem Pattern
The system repeatedly failed when trying to use GOG for Gmail search.

Observed issue:
- GOG could see that the account existed
- but it could not unlock the stored token inside the OpenClaw runtime

Representative failure message:
- `read token: no TTY available for keyring file backend password prompt; set GOG_KEYRING_PASSWORD`

## Root Cause
The shell environment had access to `GOG_KEYRING_PASSWORD`, but the OpenClaw runtime serving Telegram did not.

More specifically:
- exporting the variable in the shell was not enough
- OpenClaw was running as a **systemd user service**
- the service environment did not inherit the shell’s GOG keyring password

## Why Early Attempts Looped
The failure kept looking like a Gmail/GOG problem, but the real issue was runtime environment propagation.

What was happening:
- the shell had the password
- the running service process did not
- retrying the same GOG command without checking the service environment could not succeed

This became a good example of why runtime verification matters more than repeated retries.

## Key Repair Steps That Solved It
The effective repair path was:
1. confirm the shell had `GOG_KEYRING_PASSWORD`
2. confirm the running OpenClaw process did **not** have it
3. identify that OpenClaw was running as a user systemd service
4. create a systemd override for `openclaw-gateway.service`
5. add the environment variable there
6. reload the user systemd daemon
7. restart the service
8. verify the live process environment now included the variable
9. re-run the GOG command successfully

## Important Service Detail
Relevant system shape at the time:
- OpenClaw gateway was running as `openclaw-gateway.service`
- service env was managed by systemd user configuration

The decisive fix was making the keyring password available to the actual service runtime, not just to the shell.

## Result
After the environment fix:
- GOG Gmail search worked
- Google Docs creation worked
- Google Docs writing worked
- Drive folder organization worked

This unlocked the current documentation workflow in Google Drive.

## Lessons Learned
- Verify the runtime process, not just the shell.
- Avoid retry loops when the underlying environment has not changed.
- For service-based tools, environment propagation is often the real issue.
- Document exact fixes once they work.
- Foundational integrations deserve their own feature docs because many future workflows depend on them.

## Future Debugging Checklist
If GOG breaks again, check in this order:
1. account context
2. auth/token state
3. `GOG_KEYRING_PASSWORD`
4. shell environment vs service environment
5. whether OpenClaw is running under systemd
6. live process environment
7. only then re-test GOG operations

## Status
This repair log should be kept as a reference for future recovery and debugging.
