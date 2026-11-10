# agent-team

A starter for a small team of Claude agents run by a conductor (a "Chief of Staff"). One agent routes; specialists do the work; files and a shared log carry state between sessions that forget everything.

```bash
npx degit m2ai-portfolio/m2ai-starters/agent-team ./my-agent-team
cd my-agent-team
sqlite3 store/hive-mind.db < store/schema.sql
```

## What is in here

```
agent-team/
  agents/
    _template/agent.yaml.example   identity card: name, routing description, model, surfaces
    chief-of-staff/CLAUDE.md       the conductor's instructions: routing map, walls, state, decision tree
  docs/
    chain-example.md               a worked 3-agent chain with handoff files and depends_on
  store/
    schema.sql                     the shared hive_mind log table
```

## The three ideas

1. **One file per agent, two halves.** `agent.yaml` tells the runtime who the agent is and how to reach it. `CLAUDE.md` tells the model how to behave. The `description` field in `agent.yaml` drives routing, so write it as "what this agent does" in plain language.
2. **The conductor does not do specialist work.** It routes, sequences, and reports. If it cannot describe what it just did in one sentence that does not overlap a specialist's job, it delegated wrong.
3. **Every session forgets.** State lives in a handoff file (work in progress) or a database row (what happened). Never a variable, never "the other agent remembers."

## Make it yours

1. Copy `agents/_template/agent.yaml.example` to `agents/<agent-name>/agent.yaml` for each specialist and fill it in.
2. Give each specialist a `CLAUDE.md` that names its scope and what it must not do.
3. Fill the routing table in `agents/chief-of-staff/CLAUDE.md` with your specialists. Replace every `[PLACEHOLDER]`.
4. Decide which rules are **walls** (enforced by access: read-only folders, missing credentials, hooks) and which are **suggestions** (instructions only). Write both lists down honestly.
5. Read `docs/chain-example.md` before building your first multi-step workflow. The `depends_on` failure it describes is the most common way a chain silently breaks.

## Notes

- Model names in `agent.yaml.example` are examples. Check the current model list for your provider before you ship.
- The Telegram and Obsidian blocks are optional surfaces. Delete what you do not use.
