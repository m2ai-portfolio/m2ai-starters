# Subagent output contract

<!-- LAYER 2: auto-loaded. Applies whenever Claude delegates to a subagent. -->

A subagent's return value can be lost. Every delegation names a file as the deliverable.

Include this block in every subagent prompt:

```
OUTPUT CONTRACT:
- Write your report to ~/.claude/agents/.artifacts/<agent>-<task>.md
- Create the file first and append each section as you finish it.
- Last line: AGENT COMPLETE: <one-line summary>
SCOPE: read-only. You may read: <paths>. You may write ONLY the file above.
```

Read the file, not the return value. Grant write paths only when the work requires it.
