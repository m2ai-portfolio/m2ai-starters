# CLAUDE.md (user level)

<!--
LAYER 1: always loaded, every session, every project.
Keep this file short. Every line here costs context in every conversation.
Put a rule here only if breaking it anywhere would hurt. Everything else
goes one layer down: rules/ (auto-loaded, can be path-scoped),
reference/ (read on demand), or a skill (loaded when triggered).
-->

## Hard rules

- Never print secrets. Load API keys from one shared secrets file or secret manager (`[path]`); never scatter per-project copies.
- Never give `localhost` URLs when I am on another device. Use `[LAN-IP]:<port>`.
- Ask before anything irreversible: deleting data, force-pushing, publishing, sending messages, spending money.
- `[ADD YOUR OWN: 3 to 7 rules that apply everywhere]`

## How I want work done

- Lead with the result. Details after.
- Find the root cause before proposing a fix. No "try this and see."
- For batch work, prove one item end to end before scaling.
- Verify the artifact, not the claim: tests, diff, file on disk.

## Code

- Default stack: `[e.g. TypeScript + Node, React frontend]`.
- Before commit: typecheck, tests, lint. A green test run is required; compiling is not enough.

## On-demand reference (read only when the task touches the topic)

<!--
LAYER 3: pointers, not content. Claude sees one line here and opens the
file only when needed. This is the core of progressive disclosure.
-->

- Tech stack, databases, ports: `~/.claude/reference/tech-stack.md`
- Machines and SSH hosts: `~/.claude/reference/machines.md`
