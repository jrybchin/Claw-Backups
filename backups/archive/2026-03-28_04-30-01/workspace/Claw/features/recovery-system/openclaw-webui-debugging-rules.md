# OpenClaw Web UI Debugging Rules

## Purpose
Capture the confirmed failure pattern from the 2026-03-27 OpenClaw / Mission Control incident so future debugging does not repeat the same crash loop.

## Confirmed Incident Pattern
- The blank black screen reproduced when the live compiled bundle `~/.npm-global/lib/node_modules/openclaw/dist/control-ui/assets/index-Ij2djnNX.js` was repeatedly patched directly with Mission Control route/nav content.
- Current known-good live bundle:
  - file: `index-Ij2djnNX.js`
  - size: `604981`
  - marker check: no `missionControl`, `Mission Control`, or `mission-control` strings
- Confirmed contaminated artifacts:
  - `index-Ij2djnNX.js.pre-codex-rollback`
    - size: `623493`
    - contains Mission Control route/render strings
  - `index-Ij2djnNX.js.pre-sidebar-sidecar-`
    - size: `607158`
    - still contains Mission Control strings
- Visual checkpoints:
  - `C:\Users\jrybc\Downloads\Codex\_edge_probe.png` = true blank black screen
  - `C:\Users\jrybc\Downloads\Codex\_edge_after_restart.png` = clean login screen after rollback
  - `C:\Users\jrybc\Downloads\Codex\openclaw_mission_button_check.png` = clean login screen with the sidecar path, meaning no render crash
- The sidecar asset `assets/mission-control-sidebar-sidecar.js` is currently:
  - syntactically valid
  - served with `200 OK`
  - non-fatal
- The current sidecar issue is not the original crash. The current sidecar issue is a button-attach / DOM-lifecycle problem because the page renders but the Mission Control button does not visibly appear.

## What Actually Broke
- The unstable step was treating the compiled/minified OpenClaw control-ui bundle as a normal development surface.
- The work grew from a sidebar entry into route wiring, embedded content, runtime snapshot logic, and repeated compiled-bundle rewrites.
- That made each retry harder to reason about and increased residue/contamination risk inside the live served asset.

## What Still Works
- The current OpenClaw portal on `http://127.0.0.1:18889/`
- The local Mission Control app on `http://127.0.0.1:3001/`
- The rollback-safe bundle plus same-origin `index.html` edits
- External sidecar experimentation, as long as it stays outside the compiled app bundle

## What Memory Got Right
- The continuity system successfully preserved:
  - the canonical OpenClaw home
  - the portal/port recovery rules
  - the launcher/fallback scripts
  - the fact that compiled control-ui patching is brittle
- The artifact trail in `C:\Users\jrybc\Downloads\Codex\` made the incident timeline reconstructable.

## What Memory Missed
- Memory over-recorded the success path of the native Mission Control route and under-recorded how fragile it was.
- High-priority continuity docs did not clearly state that the live known-good state had been rolled back away from the native Mission Control route.
- The system did not store a strong enough rule saying that compiled-bundle Mission Control work must not be treated as the default future path.

## Debugging Rules
1. Separate gateway health from UI render health.
   - First check `http://127.0.0.1:18889/__openclaw/control-ui-config.json`.
   - If that answers `200`, do not call it a gateway outage until the UI asset/render path is checked separately.
2. Treat the compiled bundle as a hot zone.
   - Do not use direct compiled-bundle editing as the normal way to add Mission Control UI.
   - Only restore, diff, or roll back there unless a source checkout is impossible and the change is emergency-only.
3. Keep a known-good checkpoint before any UI experiment.
   - Preserve the active bundle, `index.html`, and screenshot state before editing.
4. After two failed UI attempts, switch strategies.
   - Stop re-patching the bundle.
   - Move to a source checkout, a same-origin sidecar, or a launcher/open-new-tab fallback.
5. Promote only after three checks pass:
   - the health endpoint answers
   - the screenshot is not black
   - visible DOM/UI evidence confirms the new button actually appears
6. Do not combine portal repair and UI surgery in one pass.
   - Fix service/port/launcher state first.
   - Then test UI changes on a stable portal.
7. Write the failure pattern into continuity docs immediately.
   - Update the recovery docs, handoff docs, daily memory, and priority continuity mirrors before more experiments.

## Instructions For Clawbot
- Assume the current live OpenClaw bundle is the rollback-safe bundle unless re-verified.
- If `missionControl` strings reappear in the active bundle unexpectedly, suspect a contaminated redeploy before trying new feature edits.
- Prefer these paths in order:
  1. source-level OpenClaw UI integration
  2. same-origin sidecar injection via `index.html` + external asset
  3. external launcher/open-new-tab integration
- Do not describe Mission Control as a current native OpenClaw route unless the active served bundle has been re-verified.
- Read this doc before attempting any new Mission Control sidebar or route work.

## Memory Correction
Older memory entries describe the native Mission Control OpenClaw route as if it were the current durable live state. Treat those entries as historical implementation attempts, not current reality.

The current known-good reality is:
- rollback-safe OpenClaw UI bundle on `18889`
- local Mission Control app on `3001`
- sidecar/button reintegration still experimental

## Next Safe Step
If Mission Control needs a sidebar button again, debug the sidecar attach bug first or move to a real source checkout. Do not revive compiled Mission Control route surgery as the default next move.
