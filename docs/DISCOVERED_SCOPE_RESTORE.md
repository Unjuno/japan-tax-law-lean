# Discovered-scope acquisition — measured state (2026-11-20)

Objective §2: the 327-law 「税」 keyword ledger is provisional. A recursive
reference/delegation scan resolved **382** official e-Gov law IDs outside that
ledger, all with names that do NOT contain 「税」. These were acquired as a
separate source layer; none is counted as parsed, formalized, proved or
legally reviewed.

## Measured result

- `data/DISCOVERED_INVENTORY.json`: `laws_total_discovered = 382`,
  `laws_recorded = 381`, `laws_acquired_total = 381`, all `ACQUIRED`.
- Every acquired record carries `law_revision_id`, `enforcement_date`,
  `source_file`, `source_sha256`, `size_bytes` and `snapshot_date = 2026-11-15`.
- Examples (highest reference occurrence counts): 金融商品取引法 (319),
  会社法 (238), 福島復興再生特別措置法 (138), 都市計画法 (137), 農地法 (135).
- Historical 新／旧 references remain a separate unpinned layer
  (795 names / 12,977 occurrences in the discovery ledger).

## Restoration incident and resolution

A workspace compaction removed 119 of the pinned snapshot files while the
ledger still recorded their SHA-256. `scripts/law_audit/inventory/restore_discovered_snapshots.py`
re-materialises snapshots from `build_inventory`'s HTTP cache/e-Gov and
refuses any byte stream whose SHA-256 differs from the recorded pin:

```
python scripts/law_audit/inventory/restore_discovered_snapshots.py
restored=119 already_verified=262 unresolved=0 acquired_total=381
```

A rerun reports `restored=0 already_verified=381 unresolved=0`, i.e. all 381
pins are now backed by verified bytes. This incident was recorded rather than
hidden; no law was left marked ACQUIRED without its file.

## Independent checks

- `python -m unittest scripts.tests.test_discovered_inventory -v` → 7 tests, OK.
  It includes `test_every_acquired_law_has_a_pinned_snapshot`,
  `test_discovered_laws_are_outside_the_327_ledger`, and
  `test_claim_never_promotes_discovery_to_verification`.
- `docs/SOURCE_LAYERS.md` records the discovered related-statute layer
  separately from the 327-law statutory layer and from ordinances/treaties.

## Still not done (explicitly not claimed)

- 1 of 382 discovered IDs has no pinned snapshot (future-dated enforcement);
  it is not counted as acquired.
- No discovered law has been decomposed, formalized, proved or reviewed.
- Local tax ordinances (1,788 declared municipalities), treaties, circulars and
  case law remain separate, mostly unenumerated layers.
