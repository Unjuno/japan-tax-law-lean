# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1258
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1258 | 395596 |
| VERSION_PINNED | 1258 | 395596 |
| STRUCTURE_IDENTIFIED | 1252 | 395602 |
| NORM_DECOMPOSED | 1257 | 395597 |
| NORMS_FORMALIZED | 1258 | 395596 |
| SPEC_IMPL_CORRESPONDENCE | 1258 | 395596 |
| BOUNDARY_CHECKED | 1258 | 395596 |
| SOURCE_AUDITED | 1258 | 395596 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 1033 units
- exceptions: 209 units
- effects: 405 units
- delegations: 207 units
- periods: 121 units
- amounts: 322 units
- rounding: 28 units
- enforcement_dates: 21 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
