# Google Account Routing

## Purpose
Define which Google account should be preferred by task type so Claw can choose the right account consistently across Gog-powered workflows.

## Account roles
### `jrybchin@gmail.com`
Preferred for:
- personal/general context
- GitHub-connected workflows
- Hugging Face-connected workflows
- GPT Premium / general consumer account context
- non-student personal Docs, Drive, Calendar, and Gmail tasks unless another account is explicitly better

### `jrybchin@terpmail.umd.edu`
Preferred for:
- UMD and school workflows
- student-benefit or student-discount contexts
- school-oriented Docs / Drive / Calendar / Gmail usage
- workflows where existing school-connected documents already live on Terpmail

## Routing rule
When a task is clearly school/UMD/student-benefit related, prefer Terpmail.

When a task is clearly personal/general, prefer Gmail.

When the task is ambiguous and account choice matters, ask or use the most contextually likely account.

## Status
This is the current Google account routing rule for multi-account Gog usage.
