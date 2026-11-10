# Tech stack reference

<!--
LAYER 3: NOT auto-loaded. This folder is deliberately outside `rules/`,
so it costs nothing until a pointer in CLAUDE.md sends Claude here.
Put bulky, look-it-up facts here: ports, database paths, service names.
-->

| Service | Where | Port | Notes |
|---|---|---:|---|
| `[app-name]` | `[host]` | `[3000]` | `[how it starts: pm2, systemd, docker]` |
| `[database]` | `[path or host]` | `[5432]` | `[backup schedule]` |

## Conventions

- Logs: `[where they go]`
- Secrets: `[secret manager or shared secrets file]`, never in the repo.
