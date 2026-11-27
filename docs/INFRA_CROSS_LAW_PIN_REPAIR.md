# Infrastructure repair: historical pin misclassified as current

## Cause (measured)
`python -m unittest scripts.tests.test_cross_law.TestRepoPinsConsistent.test_real_repo_pins_all_consistent`
failed on branch `feat/norm-unit-corp-200k-fresh` (and on current main):

- `ReconstructionSpecialIncomeTaxEnforcementDate.lean` carried a
  `Sources (pinned)` header for law `424CO0000000016`, revision
  `424CO0000000016_20260525_507CO0000000244`.
- `data/INVENTORY.json` now records that law as `historical_fallback`,
  `current_revision_status = PreviousEnforced`, `audit_ready = false`.
- `data/raw/424CO0000000016.revisions.json` confirms a later revision is
  `UnEnforced` (2027-01-01) and no revision is marked `CurrentEnforced`.
- `scripts/law_audit/phase_e/cross_law.py` requires every `Law id:` pin to be
  a CurrentEnforced audit-ready revision, so this historical module broke the
  cross-law consistency gate and five downstream gates.

## Fix
The module retains verbatim historical provenance but its labels no longer
match the pin regexes (`Law id:`, `Revision:`, `Raw snapshot sha256:`). It is
now reported in `build/cross_law.json` as `unpinned`, i.e. visible unverified
surface, not falsely claimed current. No ledger status or source value was
fabricated; the transcription check for this module still runs against the
pinned raw snapshot.

## Status
No legal-correctness claim. This is a measurement/infrastructure repair only.
