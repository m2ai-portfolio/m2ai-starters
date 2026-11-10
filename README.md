# m2ai-starters

M2AI starter templates. One subdirectory per scaffold, so new projects start from a known-good base instead of a fresh repo every time.

## Use a template

Pull a single template into a new project without cloning the whole repo:

```bash
npx degit m2ai-portfolio/m2ai-starters/<template-name> ./my-project
cd my-project
```

`degit` copies the subdirectory with no git history, so you start clean.

## Available templates

| Template | What it gives you |
|---|---|
| [`agent-team`](agent-team/) | A conductor ("Chief of Staff") plus specialist agents: `agent.yaml` identity card, conductor `CLAUDE.md` with a routing map, a worked multi-agent chain, and the shared hive-mind log schema. |
| [`claude-setup`](claude-setup/) | A Claude Code config built on progressive disclosure: user `CLAUDE.md`, auto-loaded and path-scoped rules, on-demand reference files, a skill with its own references, an enforcement hook, and the memory index format. |

## Adding a template

1. Create a subdirectory named for the template (kebab-case).
2. Put the scaffold inside, with its own README describing what it generates and how to run it.
3. Add a row to the table above.

Keep templates minimal and runnable. A template that needs a page of setup is a project, not a starter.
