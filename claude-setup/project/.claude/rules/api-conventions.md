---
paths:
  - "src/api/**"
---

# API conventions

<!-- PROJECT, PATH-SCOPED: loads only when Claude works on files under src/api/. -->

- Validate every request body at the route boundary. Reject unknown fields.
- Return errors as `{ "error": { "code": "...", "message": "..." } }`, never a bare string.
- Every new route gets a test for the success path and one failure path.
