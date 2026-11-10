---
name: handoff
description: End-of-session handoff. Writes a short note (where we are, what we decided, next step) to ~/handoffs/<project>/ so the next session, or another tool, can resume cold. Use when wrapping up a session, switching tools, or the user says "handoff" or "wrap up".
---

<!--
LAYER 4: SKILL. Only the `name` and `description` above sit in context
all the time (a few dozen tokens). This body loads when the skill
triggers. Files under references/ load only if this body tells Claude to
open them. Three levels of disclosure inside one skill.
-->

# Handoff

1. Work out the project name from the current repo folder.
2. Write `~/handoffs/<project>/<YYYY-MM-DD-HHMM>.md` with exactly three sections:
   - **Where we are**: what is true now, verified this session.
   - **What we decided**: decisions and the reason for each.
   - **Next step**: one concrete action, with the command or file to start from.
3. Point `~/handoffs/<project>/LATEST` at the new file.
4. Before writing, run the checklist in `references/checklist.md`.

Keep the note under 40 lines. A handoff nobody reads is worse than none.
