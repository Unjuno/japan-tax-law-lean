# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1280
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1280 | 395574 |
| VERSION_PINNED | 1280 | 395574 |
| STRUCTURE_IDENTIFIED | 1274 | 395580 |
| NORM_DECOMPOSED | 1279 | 395575 |
| NORMS_FORMALIZED | 1280 | 395574 |
| SPEC_IMPL_CORRESPONDENCE | 1280 | 395574 |
| BOUNDARY_CHECKED | 1280 | 395574 |
| SOURCE_AUDITED | 1280 | 395574 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 1052 units
- exceptions: 216 units
- effects: 413 units
- delegations: 207 units
- periods: 128 units
- amounts: 327 units
- rounding: 28 units
- enforcement_dates: 23 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
