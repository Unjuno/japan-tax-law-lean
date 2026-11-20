# False-positive FULLY_VERIFIED — found and fixed (2026-11-20)

An automated independent review of PR #204 found that the evidence generator
could publish `FULLY_VERIFIED` evidence for units it had not actually checked.
This record follows the H/T/D/C/U format required by the directive.

| id | H (refutable hypothesis) | T (reproduction test) | D (decision) | C (competing interpretation) | U (uncertainty) |
|---|---|---|---|---|---|
| E1 | `source_location` is computed but ignored | read generator lines computing `source_location` and the evidence dict | **CONFIRMED** — 9 units in the generation audit had `source_location: false` yet received source-location evidence | the variable might be used by `derive_status` | status derives from the evidence dict only |
| E2 | an empty spec numeral set makes literal matching vacuous | inspect `if not text or not all(k in text for k in kanji)` with `kanji == []` | **CONFIRMED** — units explicitly documented `NOT MODELLED` (InheritedPropertyTransferGain art.25_16 paras 2-3) were marked verified | a spec with only boolean logic might still model the clause | the generator is literal-based; it cannot attest non-numeric models |
| E3 | invariant axes are derived from the ledger itself | read `axes.update(record.keys())` in verify_queue_invariants | **CONFIRMED** — a ledger containing only `source_location` passes all 12 invariants | a smaller axis set might be legitimate for some units | `normative_core.EVIDENCE_AXES` is the canonical required set |
| E4 | stale evidence survives a module change | revalidation only prunes entries whose owning marker is absent | PARTIALLY MITIGATED — owned entries are rechecked per run; CI gate order (evidence → queue → invariants) is now enforced on main | other workstreams' ledger entries are intentionally preserved | cross-workstream stale entries need a global revalidation gate |

## Fix

- `generate_verification_evidence.py`: require `kanji` non-empty before
  considering a module; require `source_location` true before publishing an
  entry (clause text must occur verbatim in the scoped original of the audited
  article, so a same-numbered supplementary provision cannot inherit proof).
- `verify_queue_invariants.py`: required axes now come from
  `normative_core.EVIDENCE_AXES`, never from the ledger under test.
- `run_python_gates.py`: evidence regeneration runs before queue generation
  and queue invariants (already merged to main).

## Measured effect (same inputs, before → after)

| status | before fix | after fix |
|---|---:|---:|
| FULLY_VERIFIED | 46 | **7** |
| PROVED_SCOPE | 0 | 1 |
| NOT_STARTED | 396,806 | 396,844 |
| BLOCKED | 2 | 2 |
| queue invariants | 12/12 | 12/12 |

The 39 units removed from FULLY_VERIFIED were **false positives**, not lost
proofs. Their Lean modules are unchanged and still kernel-build; only the
claim that each specific clause was source-correspondence-audited was
unfounded. Reporting 7 evidence-backed units is the honest measurement.

No completion claim is made.
