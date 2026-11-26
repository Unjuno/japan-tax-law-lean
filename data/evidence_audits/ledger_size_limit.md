# Ledger size limit (infrastructure finding)

Date: 2026-11-27.

After the 100,000-unit SOURCE cycle, `git push` reported:
- `data/task_state.json` 50.62 MB (GitHub advisory max 50 MB)
- `data/verification_evidence.json` 66.50 MB

Push succeeded, but further mass SOURCE cycles would push these files further
past the advisory limit and slow every gate/read. Decision: pause additional
bulk SOURCE cycles; prefer targeted families and full-coverage audits, and if
more SOURCE volume is needed, split evidence into per-law shards before doing
so. No completeness claim is affected: SOURCE position is only one axis and
never by itself yields FULLY_VERIFIED.
