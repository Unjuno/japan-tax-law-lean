# §2 local-ordinance acquisition — blocker evidence

Date: 2026-11-27.

- 9 of 1,794 municipal ordinances acquired, all `ACQUIRED_NOT_REVIEWED`.
- `webfetch` successfully retrieved the Sapporo tax ordinance (pinned already),
  so generic HTTPS retrieval works.
- Web searches for a bulk index of municipal ordinance URLs returned no results
  in this environment; no machine-readable per-municipality URL list exists in
  the repository (`scripts/law_audit/inventory/local_ordinance_ledger.py` only
  consumes `data/local_ordinance_acquisitions.json`).
- Each of the remaining 1,785 municipalities needs its own authoritative URL.
  No such list is available locally and no bulk index was found.

Decision: no further ordinance acquisition is claimed. This is an external
input gap, not a completed task. Not legal advice; no completeness claim.
