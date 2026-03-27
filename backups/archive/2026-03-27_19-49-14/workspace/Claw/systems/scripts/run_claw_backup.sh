#!/usr/bin/env bash
set -euo pipefail

TS="$(date '+%Y-%m-%d %H:%M:%S %Z')"
DATE="$(date '+%Y-%m-%d')"
STAMP="$(date '+%Y-%m-%d_%H-%M-%S')"
SRC_WS="/home/jrybc/.openclaw/workspace"
SRC_OC="/home/jrybc/.openclaw"
WORKROOT="${HOME}/.openclaw-backup-work"
SANITIZED="${WORKROOT}/sanitized"
REPO_DIR="${WORKROOT}/repo"
REPO_URL="https://github.com/jrybchin/Claw-Backups.git"
BRANCH="main"
LOGFILE="${WORKROOT}/last-backup.log"
MANIFEST="${WORKROOT}/manifest.txt"
ARCHIVE_ROOT="${WORKROOT}/archive/${STAMP}"

mkdir -p "$WORKROOT"
: > "$LOGFILE"
: > "$MANIFEST"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"
}

safe_copy() {
  local src="$1"
  local dest="$2"
  if [ -e "$src" ]; then
    mkdir -p "$(dirname "$dest")"
    cp -a "$src" "$dest"
    echo "${dest#${SANITIZED}/}" >> "$MANIFEST"
  fi
}

sanitize_with_python() {
  python3 - <<'PY' "$SANITIZED" "$LOGFILE"
import os,re,sys
base,logfile=sys.argv[1],sys.argv[2]
patterns=[
    (re.compile(r'[A-Za-z0-9_\-]{24,}:[A-Za-z0-9_\-]{20,}'), '[TELEGRAM_BOT_TOKEN]'),
    (re.compile(r'(GOG_KEYRING_PASSWORD=[GOG_KEYRING_PASSWORD]
    (re.compile(r'(OPENAI_API_KEY=[OPENAI_API_KEY]
    (re.compile(r'(GEMINI_API_KEY=[GEMINI_API_KEY]
    (re.compile(r'(ANTHROPIC_API_KEY=[ANTHROPIC_API_KEY]
    (re.compile(r'("botToken"\s*:\s*")[^"]+(")'), r'\1[TELEGRAM_BOT_TOKEN]\2'),
    (re.compile(r'("token"\s*:\s*")[^"]+(")'), r'\1[TOKEN]\2'),
    (re.compile(r'("apiKey"\s*:\s*")[^"]+(")'), r'\1[API_KEY]\2'),
    (re.compile(r'("password"\s*:\s*")[^"]+(")'), r'\1[PASSWORD]\2'),
    (re.compile(r'(botToken\s*[:=]\s*["\'])[^"\']+(["\'])'), r'\1[TELEGRAM_BOT_TOKEN]\2'),
    (re.compile(r'(token\s*[:=]\s*["\'])[^"\']+(["\'])'), r'\1[TOKEN]\2'),
    (re.compile(r'(apiKey\s*[:=]\s*["\'])[^"\']+(["\'])'), r'\1[API_KEY]\2'),
    (re.compile(r'(password\s*[:=]\s*["\'])[^"\']+(["\'])'), r'\1[PASSWORD]\2'),
]
scan=re.compile(r'(AKIA|AIza|sk-[A-Za-z0-9]|xox[baprs]-|ghp_[A-Za-z0-9]|github_pat_|-----BEGIN|botToken|apiKey|token|password|secret|authorization|Bearer )')
findings=[]
for root,_,files in os.walk(base):
    for name in files:
        path=os.path.join(root,name)
        try:
            with open(path,'r',encoding='utf-8',errors='ignore') as f:
                text=f.read()
        except Exception:
            continue
        orig=text
        for pat,repl in patterns:
            text=pat.sub(repl,text)
        if text!=orig:
            with open(path,'w',encoding='utf-8') as f:
                f.write(text)
        for i,line in enumerate(text.splitlines(),1):
            if scan.search(line):
                findings.append(f'{path}:{i}:{line[:220]}')
with open(logfile,'a',encoding='utf-8') as f:
    for item in findings:
        f.write(item+'\n')
PY
}

send_telegram_notice() {
  local text="$1"
  python3 - <<'PY' "$text" >> "$LOGFILE" 2>&1 || true
import json,sys,urllib.request
msg=sys.argv[1]
conf='/home/jrybc/.openclaw/openclaw.json'
try:
    with open(conf) as f:
        data=json.load(f)
    token=data['channels']['telegram']['botToken']
    chat_id='6304819296'
    url=f'https://api.telegram.org/bot{token}/sendMessage'
    body=json.dumps({'chat_id': chat_id, 'text': msg}).encode()
    req=urllib.request.Request(url, data=body, headers={'Content-Type':'application/json'})
    urllib.request.urlopen(req, timeout=20).read()
    print('telegram notice sent')
except Exception as e:
    print(f'telegram notice failed: {e}')
PY
}

log "starting sanitized backup run at $TS"
rm -rf "$SANITIZED"
mkdir -p "$SANITIZED"

safe_copy "$SRC_WS/SOUL.md" "$SANITIZED/workspace/SOUL.md"
safe_copy "$SRC_WS/USER.md" "$SANITIZED/workspace/USER.md"
safe_copy "$SRC_WS/IDENTITY.md" "$SANITIZED/workspace/IDENTITY.md"
safe_copy "$SRC_WS/AGENTS.md" "$SANITIZED/workspace/AGENTS.md"
safe_copy "$SRC_WS/TOOLS.md" "$SANITIZED/workspace/TOOLS.md"
safe_copy "$SRC_WS/HEARTBEAT.md" "$SANITIZED/workspace/HEARTBEAT.md"
safe_copy "$SRC_WS/MEMORY.md" "$SANITIZED/workspace/MEMORY.md"
safe_copy "$SRC_WS/MEMORY.md" "$SANITIZED/workspace/MEMORY-${STAMP}.md"
safe_copy "$SRC_WS/Claw Plan.md" "$SANITIZED/workspace/Claw Plan.md"

for d in memory Claw skills; do
  if [ -d "$SRC_WS/$d" ]; then
    mkdir -p "$SANITIZED/workspace"
    cp -a "$SRC_WS/$d" "$SANITIZED/workspace/"
    find "$SANITIZED/workspace/$d" -type f >> "$MANIFEST" || true
  fi
done

safe_copy "$SRC_OC/openclaw.json" "$SANITIZED/openclaw/openclaw.json"
for d in credentials identity devices; do
  if [ -d "$SRC_OC/$d" ]; then
    mkdir -p "$SANITIZED/openclaw"
    cp -a "$SRC_OC/$d" "$SANITIZED/openclaw/"
    find "$SANITIZED/openclaw/$d" -type f >> "$MANIFEST" || true
  fi
done

python3 - <<'PY' "$SANITIZED" "$LOGFILE"
import json,glob,os,sys
sanitized,logfile=sys.argv[1],sys.argv[2]
base=os.path.expanduser('~/.openclaw')
out=os.path.join(sanitized,'openclaw','session-index.json')
sessions=glob.glob(os.path.join(base,'agents','*','sessions','*.jsonl'))
os.makedirs(os.path.dirname(out), exist_ok=True)
with open(out,'w') as f:
    json.dump({'sessionLogs': sessions}, f, indent=2)
with open(logfile,'a') as f:
    f.write(f'captured {len(sessions)} session log paths\n')
PY

echo "openclaw/session-index.json" >> "$MANIFEST"

sanitize_with_python

if [ ! -d "$REPO_DIR/.git" ]; then
  rm -rf "$REPO_DIR"
  git clone "$REPO_URL" "$REPO_DIR" >> "$LOGFILE" 2>&1
fi

cd "$REPO_DIR"
git checkout "$BRANCH" >> "$LOGFILE" 2>&1 || git checkout -b "$BRANCH" >> "$LOGFILE" 2>&1
mkdir -p backups/latest
mkdir -p "backups/archive/${STAMP}"
rm -rf backups/latest/*
cp -a "$SANITIZED"/. "backups/latest/"
cp -a "$LOGFILE" "backups/latest/last-backup.log"
cp -a "$MANIFEST" "backups/latest/manifest.txt"
cp -a "$SANITIZED"/. "backups/archive/${STAMP}/"
cp -a "$LOGFILE" "backups/archive/${STAMP}/last-backup.log"
cp -a "$MANIFEST" "backups/archive/${STAMP}/manifest.txt"
printf '%s\n' "$STAMP" > backups/latest/BACKUP_TIMESTAMP.txt
printf '%s\n' "$TS" > "backups/archive/${STAMP}/BACKUP_TIMESTAMP.txt"

SUMMARY="$(git status --short backups | sed -n '1,12p' | tr '\n' '; ' || true)"
[ -n "$SUMMARY" ] || SUMMARY="archive sanitized Claw backup"

git add backups
if git diff --cached --quiet; then
  log "no backup changes to commit"
  send_telegram_notice "Claw backup OK ($DATE): no changes"
  exit 0
fi

git commit -m "Backup ${STAMP} - $SUMMARY" >> "$LOGFILE" 2>&1
git push origin "$BRANCH" >> "$LOGFILE" 2>&1
send_telegram_notice "Claw backup OK ($DATE, archived $STAMP)"
log "backup push complete"
