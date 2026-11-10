# AGENTS.md

Tool-neutral instructions for any coding agent working in this repo. Claude Code reads it through the `@AGENTS.md` import in `CLAUDE.md`.

## Working contract

- Keep going until the task is done. Stop only for something destructive, a spend, a missing credential, or publishing.
- On failure, read the actual error, name the assumption it broke, and try a second route before reporting.
- Do not commit or push unless asked.

## Project facts

- `[Language, framework, package manager]`
- `[How to run the app and see a change working]`
