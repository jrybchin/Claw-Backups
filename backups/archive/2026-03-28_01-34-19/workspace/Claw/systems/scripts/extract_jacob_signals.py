#!/usr/bin/env python3
import json
import re
from pathlib import Path
from datetime import datetime

ROOT = Path('/home/jrybc/.openclaw/workspace')
chat_path = ROOT / 'ChatExport_2026-03-27.txt'
out_path = ROOT / 'Claw' / 'systems' / 'jacob-signal-ingestion.json'

SIGNALS = []

patterns = [
    (re.compile(r'no need for approval.*adding is fine', re.I | re.S), 'execution', 'privateWritesNoApproval', 'explicit-preference', 'Private writes like calendar/docs updates do not need separate approval when directly requested.'),
    (re.compile(r'keep responses concise by default|avoid flattering filler', re.I), 'communication', 'brevityDefault', 'explicit-preference', 'Keep responses concise and avoid filler.'),
    (re.compile(r'direct answers and concrete outputs', re.I), 'communication', 'concreteOutputs', 'explicit-preference', 'Prefer direct answers and concrete outputs.'),
    (re.compile(r'broad source capture|preserve raw-source nuance|avoid guessing', re.I), 'research', 'breadthForHighStakes', 'architectural-signal', 'Prefer broad retrieval and nuance preservation in high-stakes tasks.'),
    (re.compile(r'finish the dependency chain|do everything that can reasonably be done automatically', re.I), 'execution', 'completionStandard', 'architectural-signal', 'Finish dependency chains and do as much automatically as possible.'),
]

if chat_path.exists():
    text = chat_path.read_text(errors='ignore')
    for rx, group, key, signal_type, note in patterns:
        if rx.search(text):
            SIGNALS.append({
                'id': f'auto-{group}-{key}',
                'createdAt': datetime.utcnow().isoformat() + 'Z',
                'source': 'chat-export',
                'group': group,
                'key': key,
                'signalType': signal_type,
                'note': note,
                'confidenceDelta': 0.03,
                'evidence': note,
            })

payload = {
    'schemaVersion': 1,
    'updatedAt': datetime.utcnow().isoformat() + 'Z',
    'signals': SIGNALS,
}
out_path.write_text(json.dumps(payload, indent=2) + '\n')
print(f'wrote {out_path} with {len(SIGNALS)} signals')
