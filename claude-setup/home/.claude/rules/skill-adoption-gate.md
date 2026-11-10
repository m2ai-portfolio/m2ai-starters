---
paths:
  - ".claude/skills/**"
  - ".claude/hooks/**"
---

# Skill adoption gate

<!--
LAYER 2, PATH-SCOPED: the `paths:` frontmatter means this rule loads only
when Claude works with a file matching one of the globs. Zero context
cost in every other session. Use this for rules that matter only to one
part of a codebase or config.
-->

A new skill or hook is experimental for 14 days. It stays only if, in that window:

1. I invoke it at least 3 times, or
2. Another active rule, hook, or skill names it as a dependency.

Otherwise move it to an archive folder. Never delete the only copy.

Before writing a new skill, check existing skills for overlap. Extend before adding.
