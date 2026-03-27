#!/usr/bin/env bash
set -euo pipefail

SRC_BASE="/home/jrybc/.openclaw/workspace"
DEST_BASE="/mnt/c/Users/jrybc/Codex-Claw-Mirror"

mkdir -p "$DEST_BASE/core" "$DEST_BASE/recovery" "$DEST_BASE/reference"

copy_file() {
  local src="$1"
  local dest="$2"
  if [ -f "$src" ]; then
    install -D -m 0644 "$src" "$dest"
  fi
}

# Core
copy_file "$SRC_BASE/Claw/logic/active-tasks-list.md" "$DEST_BASE/core/active-tasks-list.md"
copy_file "$SRC_BASE/Claw/logic/transplantable-system-logic.md" "$DEST_BASE/core/transplantable-system-logic.md"
copy_file "$SRC_BASE/Claw/logic/human-system-explanation.md" "$DEST_BASE/core/human-system-explanation.md"
copy_file "$SRC_BASE/Claw/systems/documentation-rules.md" "$DEST_BASE/core/documentation-rules.md"
copy_file "$SRC_BASE/Claw/systems/memory-and-source-handling-rules.md" "$DEST_BASE/core/memory-and-source-handling-rules.md"

# Recovery
copy_file "$SRC_BASE/Claw/features/recovery-system/live-system-status-report.md" "$DEST_BASE/recovery/live-system-status-report.md"
copy_file "$SRC_BASE/Claw/features/recovery-system/crash-prevention-failsafe-checklist.md" "$DEST_BASE/recovery/crash-prevention-failsafe-checklist.md"
copy_file "$SRC_BASE/Claw/features/recovery-system/backup-lifeline-codex-recovery.md" "$DEST_BASE/recovery/backup-lifeline-codex-recovery.md"
copy_file "$SRC_BASE/Claw/features/recovery-system/codex-recovery-agent-instructions.md" "$DEST_BASE/recovery/codex-recovery-agent-instructions.md"

# Reference
copy_file "$SRC_BASE/Claw/features/gog/gog-feature-overview.md" "$DEST_BASE/reference/gog-feature-overview.md"
copy_file "$SRC_BASE/Claw/features/gog/gog-setup-and-repair-log.md" "$DEST_BASE/reference/gog-setup-and-repair-log.md"

# Top-level convenience copies
copy_file "$SRC_BASE/Claw/logic/claw-full-sweep-prompt.md" "$DEST_BASE/claw-full-sweep-prompt.md"
copy_file "$SRC_BASE/Claw Plan.md" "$DEST_BASE/Claw Plan.md"

cat > "$DEST_BASE/README.txt" <<'EOF'
Codex Claw Mirror

This folder is a Windows-facing mirror of the most important Claw docs for Codex.

Subfolders:
- core
- recovery
- reference

Start with:
- Claw Plan.md
- core/active-tasks-list.md
- core/transplantable-system-logic.md
- recovery/live-system-status-report.md
- recovery/codex-recovery-agent-instructions.md
EOF

date > "$DEST_BASE/last_sync.txt"
echo "Synced Codex mirror to $DEST_BASE"
