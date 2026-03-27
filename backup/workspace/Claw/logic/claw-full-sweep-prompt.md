# Claw Full Sweep Prompt

Use this prompt to trigger a full Claw documentation and logic consistency sweep.

```text
Do a full Claw documentation and logic consistency sweep.

Read through the Claw folder and all relevant docs in its current structure, including logic docs, system docs, feature docs, indexes, status docs, and any mirrored/local source-of-truth files that matter for consistency.

Your goal is to bring the whole Claw documentation system into alignment so it works as one coherent system.

During this sweep, do all of the following:

1. Review all documents for consistency of:
- terminology
- folder structure
- naming conventions
- logic
- response behavior
- documentation philosophy
- recovery and crash-prevention philosophy
- machine-facing vs human-facing distinctions
- index style
- feature organization
- status/update behavior

2. Use the current crash-prevention, recovery, documentation, response, and system-maintenance logic as the main standard for alignment.

3. Update affected docs so they match the current documented logic, including:
- Transplantable System Logic
- Human System Explanation
- Documentation Rules
- Response Logic
- Claw Plan
- Recovery System docs
- GOG docs
- indexes
- any other relevant docs in Claw

4. Give **Claw Plan** its own dedicated pass during the sweep so the roadmap stays aligned with the current system architecture, logic, priorities, and documentation model.

5. Give the **Logic layer** its own dedicated pass during the sweep so the central Claw logic stays aligned with everything else and remains one of the most consistently updated parts of the system.

6. Treat **Claw Plan** and the **Logic layer** as central alignment docs that should receive especially strong attention during a full sweep.

7. During the sweep, check whether any important Google Docs appear to contain newer manual edits that should be reflected back into the local OpenClaw source files.

8. If a Google Doc has meaningful newer content or manual edits, sync that content back into the corresponding local Claw file so Drive edits do not drift away from the local source-of-truth layer.

9. Treat full sweeps as two-way consistency checks between the local Claw files and the mirrored Google Docs, not just one-way local-to-Drive pushes.

10. Propagate relevant changes across affected docs rather than leaving good logic isolated in only one place. Focus on adding information not subtracting.

11. Keep indexes human-facing and table-of-contents style:
- only cover docs in the same folder as the index
- do not describe subfolders
- include brief section-by-section descriptions for each same-folder doc

12. Keep human-facing docs simple and easy to scan.
Keep machine-facing docs more precise and transferable.

13. Make sure the docs reflect current preferences, including:
- summary / conclusion / next steps structure when appropriate
- adaptation to what the user actually pays attention to
- broad source-searching with selective durable memory
- proactive internal checking before asking the user to do manual troubleshooting
- cleaner multi-agent coordination
- consistent documentation sync when relevant information changes

14. Retroactively add missing context to docs where a major lesson, repair, pattern, or system behavior should already be documented but is missing.

15. Keep the system organized. If a document belongs in a different folder or needs a clearer structure, fix that.

16. Update Google Drive mirrored docs to match the improved local source-of-truth files.

17. Document changes in accordance with documentation standards for recordkeeping and system recovery.

18. Be proactive and take the time needed. Do not do a shallow pass. Do a real full sweep.

At the end:
- summarize what was standardized
- summarize what major inconsistencies were fixed
- summarize any docs that still need later human review
- suggest any docs that still need later human review due to possible large changes
```
