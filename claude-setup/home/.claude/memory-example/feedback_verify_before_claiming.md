---
name: verify-before-claiming
description: Check live state before reporting status carried over from a past session
metadata:
  type: feedback
---

Claims from earlier sessions, handoffs, and memory files are hypotheses until checked against the live system.

**Why:** a handoff said a service was running; it had crashed two days earlier and the report went out wrong.

**How to apply:** before stating any status, run one read-only check (process list, health endpoint, `git status`) and say which claims were verified.
