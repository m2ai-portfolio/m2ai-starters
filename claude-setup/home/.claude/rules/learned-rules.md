# Learned rules

<!--
LAYER 2: auto-loaded at session start (no `paths:` frontmatter).
Each rule is a lesson from a real incident. Write the rule, not the story.
If a rule only matters in one project, put it in that project's CLAUDE.md.
If it only matters for certain files, give it `paths:` frontmatter
(see skill-adoption-gate.md).
-->

## Environment

- Load shared secrets before a project's local env file; the reverse order drops shared keys in cron.
- Stale lock files in `/tmp` can block scheduled jobs after a crash. Check them first when a pipeline silently stops.
- Never pipe a transform into `crontab -`: a failed transform installs an empty crontab. Snapshot, edit a file, count jobs, then install.

## Deletion

- Before `rm -rf` on a repo, check untracked data (`*.db`, `store/`, JSON state) and anything that points at the path (crontab, scripts, configs).

## Working style

- Model or pipeline JSON can contain missing keys, nesting and stray text. Parse defensively with clear errors.
- Guard expensive invariants twice: at the point of intent (a rule or skill) and at the point of action (a hook). Neither trusts the other.

## [YOUR SECTION]

- `[One line per lesson. Add one each time something bites you twice.]`
