#!/usr/bin/env python3
import argparse
import datetime as dt
import hashlib
import json
import os
import pathlib
import subprocess
import sys

ROOT = pathlib.Path('/home/jrybc/.openclaw/workspace')
MANIFEST_PATH = ROOT / 'Claw/systems/drive-live-sync-manifest.json'
STATE_PATH = ROOT / 'Claw/systems/drive-live-sync-state.json'
LOG_DIR = ROOT / 'Claw/systems/logs/drive-live-sync'
LOG_DIR.mkdir(parents=True, exist_ok=True)


def iso_now():
    return dt.datetime.now(dt.timezone.utc).astimezone().isoformat()


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode('utf-8')).hexdigest()


def load_json(path: pathlib.Path, default):
    if not path.exists():
        return default
    return json.loads(path.read_text())


def save_json(path: pathlib.Path, data):
    path.write_text(json.dumps(data, indent=2) + '\n')


def run(cmd):
    return subprocess.run(cmd, text=True, capture_output=True)


def main():
    parser = argparse.ArgumentParser(description='Sync selected live/current local docs to Google Drive docs if changed.')
    parser.add_argument('--force', action='store_true', help='Write all mapped docs regardless of hash state')
    parser.add_argument('--dry-run', action='store_true', help='Show what would sync without writing to Drive')
    args = parser.parse_args()

    manifest = load_json(MANIFEST_PATH, None)
    if manifest is None:
        print(f'Manifest not found: {MANIFEST_PATH}', file=sys.stderr)
        return 1
    state = load_json(STATE_PATH, {'version': 1, 'lastRun': None, 'docs': {}})

    account = manifest['account']
    docs = manifest.get('docs', [])
    started = iso_now()
    results = []

    for entry in docs:
        key = entry['key']
        local_path = ROOT / entry['localPath']
        drive_doc_id = entry['driveDocId']
        if not local_path.exists():
            results.append({
                'key': key,
                'status': 'missing-local',
                'localPath': str(local_path),
                'driveDocId': drive_doc_id,
            })
            continue

        text = local_path.read_text()
        content_hash = sha256_text(text)
        previous = state.get('docs', {}).get(key, {})
        changed = args.force or previous.get('sha256') != content_hash

        item = {
            'key': key,
            'localPath': str(local_path),
            'driveDocId': drive_doc_id,
            'sha256': content_hash,
            'changed': changed,
        }

        if not changed:
            item['status'] = 'unchanged'
            results.append(item)
            continue

        if args.dry_run:
            item['status'] = 'would-sync'
            results.append(item)
            continue

        cmd = ['gog', 'docs', 'write', drive_doc_id, '--file', str(local_path), '--account', account]
        proc = run(cmd)
        item['command'] = cmd
        item['returncode'] = proc.returncode
        item['stdout'] = proc.stdout.strip()
        item['stderr'] = proc.stderr.strip()
        if proc.returncode == 0:
            item['status'] = 'synced'
            state.setdefault('docs', {})[key] = {
                'sha256': content_hash,
                'lastSyncedAt': iso_now(),
                'driveDocId': drive_doc_id,
                'localPath': entry['localPath'],
            }
        else:
            item['status'] = 'error'
        results.append(item)

    state['lastRun'] = iso_now()
    save_json(STATE_PATH, state)

    log_payload = {
        'startedAt': started,
        'finishedAt': iso_now(),
        'dryRun': args.dry_run,
        'force': args.force,
        'results': results,
    }
    log_path = LOG_DIR / f"sync-{dt.datetime.now().strftime('%Y%m%d-%H%M%S')}.json"
    save_json(log_path, log_payload)

    summary = {
        'synced': sum(1 for r in results if r['status'] == 'synced'),
        'unchanged': sum(1 for r in results if r['status'] == 'unchanged'),
        'would_sync': sum(1 for r in results if r['status'] == 'would-sync'),
        'errors': sum(1 for r in results if r['status'] == 'error'),
        'missing_local': sum(1 for r in results if r['status'] == 'missing-local'),
        'log': str(log_path),
    }
    print(json.dumps(summary, indent=2))
    return 1 if summary['errors'] else 0


if __name__ == '__main__':
    raise SystemExit(main())
