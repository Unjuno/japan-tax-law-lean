# §2 historical 附則 mapping — negative evidence (no mapping claimed)

Date: 2026-11-27. Read-only analysis of local pinned metadata.
Not legal advice; not a completeness claim.

## H/T/D/C/U
- H = a 附則 新/旧法 reference can be mapped to a unique `law_revision_id` using
  the defining-clause era dates and the revision metadata already pinned locally.
- T = `build/historical_reference_contexts.json` (87 references) cross-checked
  against `data/historical_revision_pins.json` (59 laws, revision candidates).
- D = only **6** references are "pin feasible" (at least one era date intersects
  a candidate enforcement date); 42 have a defining clause, 45 do not; 6 acquired
  snapshots are 2026 revisions and cannot be the historical amendment.
  The strongest case, `新地方法人税法` (base `426AC0000000011`, 2020-04-01),
  has **3** distinct candidates with that exact enforcement date:
  `502AC0000000008` (所得税法等の一部を改正する法律),
  `501AC0000000016` (行政手続等の…一部を改正する法律),
  `430AC0000000007` (所得税法等の一部を改正する法律).
  Therefore even the unique-date case is non-discriminative.
- C = date/title matching does not establish *amendment-law identity*; using it
  would be an unfounded mapping, not evidence.
- U = no full-text amendment-law snapshot is available locally; `law_data/{id}`
  previously returned HTTP 404. Mapping remains **0 / 87**.

## Decision
No revision mapping is recorded. Further progress requires amendment-law
full-text snapshots or another authoritative identity signal; none is present
in the pinned data. The 87 references stay unresolved and are reported as such.
