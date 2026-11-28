# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1290
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1290 | 395564 |
| VERSION_PINNED | 1290 | 395564 |
| STRUCTURE_IDENTIFIED | 1284 | 395570 |
| NORM_DECOMPOSED | 1289 | 395565 |
| NORMS_FORMALIZED | 1290 | 395564 |
| SPEC_IMPL_CORRESPONDENCE | 1290 | 395564 |
| BOUNDARY_CHECKED | 1290 | 395564 |
| SOURCE_AUDITED | 1290 | 395564 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 1061 units
- exceptions: 217 units
- effects: 417 units
- delegations: 207 units
- periods: 130 units
- amounts: 330 units
- rounding: 28 units
- enforcement_dates: 22 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
