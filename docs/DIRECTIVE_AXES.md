# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1183
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1183 | 395671 |
| VERSION_PINNED | 1183 | 395671 |
| STRUCTURE_IDENTIFIED | 1177 | 395677 |
| NORM_DECOMPOSED | 1182 | 395672 |
| NORMS_FORMALIZED | 1183 | 395671 |
| SPEC_IMPL_CORRESPONDENCE | 1183 | 395671 |
| BOUNDARY_CHECKED | 1183 | 395671 |
| SOURCE_AUDITED | 1183 | 395671 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 969 units
- exceptions: 203 units
- effects: 390 units
- delegations: 201 units
- periods: 108 units
- amounts: 315 units
- rounding: 28 units
- enforcement_dates: 18 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
