-- Hive mind: shared cross-agent log.
-- Create with: sqlite3 store/hive-mind.db < store/schema.sql
--
-- This is coordination memory, not state transfer. Work in progress moves
-- between agents through handoff files (see docs/chain-example.md).

CREATE TABLE IF NOT EXISTS hive_mind (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  agent_id    TEXT    NOT NULL,          -- who acted
  chat_id     TEXT,                      -- optional: conversation/thread id
  action      TEXT    NOT NULL,          -- short verb, e.g. data_pull, retro_written
  summary     TEXT    NOT NULL,          -- one or two sentences a human can scan
  artifacts   TEXT,                      -- optional: file paths, comma-separated
  created_at  INTEGER NOT NULL           -- unix seconds: strftime('%s','now')
);

CREATE INDEX IF NOT EXISTS idx_hive_mind_created ON hive_mind (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_hive_mind_agent   ON hive_mind (agent_id, created_at DESC);
