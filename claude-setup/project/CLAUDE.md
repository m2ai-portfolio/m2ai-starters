# CLAUDE.md ([project name])

@AGENTS.md

<!--
PROJECT LAYER: loaded when Claude starts in this repo, on top of the
user-level ~/.claude/CLAUDE.md. Put only what is true for THIS project.
The @AGENTS.md line imports a tool-neutral file, so Codex, Cursor and
other agents read the same instructions without a second copy.
-->

## Commands

- Install: `[npm install]`
- Dev: `[npm run dev]`
- Test: `[npm test]`
- Typecheck: `[npx tsc --noEmit]`

## Invariants

- `[A thing that must always be true, e.g. "migrations are append-only"]`
- `[A file that is generated and must never be hand-edited, and the command that regenerates it]`

## Where things are

- API routes: `src/api/` (rules in `.claude/rules/api-conventions.md` load automatically when you touch these files)
- `[other key paths]`
