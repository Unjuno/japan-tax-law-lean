# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1021

- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1021 | 395833 |
| VERSION_PINNED | 1021 | 395833 |
| STRUCTURE_IDENTIFIED | 1014 | 395840 |
| NORM_DECOMPOSED | 1020 | 395834 |
| NORMS_FORMALIZED | 1021 | 395833 |
| SPEC_IMPL_CORRESPONDENCE | 1021 | 395833 |
| BOUNDARY_CHECKED | 1021 | 395833 |
| SOURCE_AUDITED | 1020 | 395834 |


## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 830 units
- exceptions: 185 units
- effects: 361 units
- delegations: 176 units
- periods: 88 units
- amounts: 272 units

- rounding: 27 units
- enforcement_dates: 15 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
