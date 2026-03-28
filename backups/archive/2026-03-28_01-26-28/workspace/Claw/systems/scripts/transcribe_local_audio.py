#!/usr/bin/env python3
import argparse
import json
import sys
from faster_whisper import WhisperModel

parser = argparse.ArgumentParser(description='Transcribe local audio with faster-whisper')
parser.add_argument('audio_path')
parser.add_argument('--model', default='base')
parser.add_argument('--task', default='transcribe', choices=['transcribe', 'translate'])
parser.add_argument('--language', default=None)
parser.add_argument('--json', action='store_true')
args = parser.parse_args()

model = WhisperModel(args.model, device='cpu', compute_type='int8')
segments, info = model.transcribe(args.audio_path, task=args.task, language=args.language, vad_filter=True)
segments = list(segments)
text = ''.join(seg.text for seg in segments).strip()

if args.json:
    print(json.dumps({
        'text': text,
        'language': info.language,
        'language_probability': info.language_probability,
        'segments': [
            {
                'start': s.start,
                'end': s.end,
                'text': s.text,
            } for s in segments
        ]
    }, ensure_ascii=False, indent=2))
else:
    print(text)
