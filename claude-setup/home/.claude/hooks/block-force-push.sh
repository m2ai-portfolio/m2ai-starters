#!/usr/bin/env bash
# PreToolUse hook for the Bash tool.
#
# LAYER 5: ENFORCEMENT. A rule in CLAUDE.md is a suggestion the model can
# miss. A hook is a wall: it runs on every matching tool call, outside the
# model, and exit code 2 blocks the call and shows stderr to Claude.
#
# Rule of thumb: if breaking the rule once would cost you a day, make it a
# hook. Keep the matching rule in CLAUDE.md too, so Claude knows why.

input="$(cat)"
cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // empty')"

if printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+push.*(--force|-f([[:space:]]|$)|--force-with-lease)'; then
  echo "Blocked: force-push is not allowed from Claude. Push normally or ask the user to run it." >&2
  exit 2
fi

exit 0
