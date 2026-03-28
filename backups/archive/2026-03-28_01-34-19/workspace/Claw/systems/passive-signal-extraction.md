# Passive Signal Extraction

## Purpose
Describe how the Jacob adaptation system should gather signals from real work history, corrections, and transcripts instead of relying only on manual UI input.

## Current approach
The first passive extractor reads available chat export material and looks for:
- explicit preference statements
- approval boundary clarifications
- response-style instructions
- retrieval/nuance instructions
- execution/completion corrections

## Rules
- Passive extraction should create candidate signals, not unquestionable truth.
- Extracted signals should enter the signal-ingestion layer with source labels.
- Confidence adjustments should remain modest by default.
- Stronger promotions should still rely on repeated evidence, explicit confirmation, or review.

## Status
This is the first passive signal extraction layer for the Jacob adaptation system.
