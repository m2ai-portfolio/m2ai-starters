# claude-setup

A starter Claude Code configuration built around **progressive disclosure**: Claude loads a little context always, more when a file or task calls for it, and the rest only when it asks. Rules that must never break are enforced by hooks, not just written down.

Every file is a template. Replace the `[PLACEHOLDERS]` with your own setup.

```bash
npx degit m2ai-portfolio/m2ai-starters/claude-setup ./claude-setup
```

## The layers

| Layer | File(s) | Loaded when | Context cost |
|---|---|---|---|
| 1. User memory | `home/.claude/CLAUDE.md` | Every session, every project | Always. Keep it short. |
| 2. Rules | `home/.claude/rules/*.md` | Session start | Always, unless scoped |
| 2b. Path-scoped rules | `rules/*.md` with `paths:` frontmatter | Claude works with a matching file | Zero until it matters |
| 3. Reference | `home/.claude/reference/*.md` | Claude follows a pointer in CLAUDE.md | Zero until read |
| 4. Skills | `home/.claude/skills/<name>/SKILL.md` | Name + description always; body on trigger; `references/` on demand | A few tokens until used |
| 5. Hooks | `home/.claude/hooks/*.sh` + `settings.json` | Every matching tool call, outside the model | None. Runs as code. |
| 6. Auto-memory | `MEMORY.md` index + topic files | Index each session; topics when relevant | One line per memory |
| Project | `project/CLAUDE.md`, `AGENTS.md`, `.claude/rules/` | Claude starts in that repo | Only in that repo |

The question for every new instruction: **what is the lowest layer that still gets it read at the right moment?**

- Breaks something anywhere if missed: layer 1.
- A lesson from an incident: layer 2.
- Only matters for certain files: layer 2b.
- A fact you look up (ports, hosts, paths): layer 3.
- A repeatable procedure: layer 4.
- Must never happen, even if Claude forgets: layer 5, plus a line in layer 1 saying why.

## Suggestions vs walls

Text in CLAUDE.md and rules is a **suggestion**: Claude follows it almost always, but can miss it in a long session. A hook is a **wall**: it runs on every tool call whether Claude remembers the rule or not. `hooks/block-force-push.sh` is the example. Exit code `2` blocks the call and sends the message back to Claude.

Write both down, and be honest about which is which.

## Layout

```
claude-setup/
  home/.claude/                     copy into ~/.claude/
    CLAUDE.md                       layer 1
    rules/
      learned-rules.md              layer 2: incident lessons
      subagent-output-contract.md   layer 2: delegation contract
      skill-adoption-gate.md        layer 2b: path-scoped example
    reference/
      tech-stack.md                 layer 3
      machines.md                   layer 3
    skills/handoff/
      SKILL.md                      layer 4
      references/checklist.md       layer 4, loaded by step 4
    hooks/block-force-push.sh       layer 5
    settings.example.json           wires the hook
    memory-example/                 layer 6: index + one topic file
  project/                          copy into a repo root
    CLAUDE.md                       imports AGENTS.md
    AGENTS.md                       tool-neutral instructions
    .claude/rules/api-conventions.md  path-scoped project rule
```

## Install

```bash
mkdir -p ~/.claude
cp -rn claude-setup/home/.claude/. ~/.claude/
chmod +x ~/.claude/hooks/block-force-push.sh
```

`cp -n` will not overwrite files you already have. Merge `settings.example.json` into `~/.claude/settings.json` by hand. The hook needs `jq`.

`memory-example/` shows the format only. Claude Code writes real auto-memory under `~/.claude/projects/<project-slug>/memory/`; you do not copy it anywhere.

For a repo: copy `project/CLAUDE.md`, `project/AGENTS.md` and `project/.claude/` into the repo root.

## Check it took

Start Claude Code and run `/memory` to see which memory files loaded. Ask it to `git push --force` in a scratch repo: the hook should block it.
