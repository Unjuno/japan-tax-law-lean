# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1261
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1261 | 395593 |
| VERSION_PINNED | 1261 | 395593 |
| STRUCTURE_IDENTIFIED | 1255 | 395599 |
| NORM_DECOMPOSED | 1260 | 395594 |
| NORMS_FORMALIZED | 1261 | 395593 |
| SPEC_IMPL_CORRESPONDENCE | 1261 | 395593 |
| BOUNDARY_CHECKED | 1261 | 395593 |
| SOURCE_AUDITED | 1261 | 395593 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 1036 units
- exceptions: 209 units
- effects: 408 units
- delegations: 205 units
- periods: 121 units
- amounts: 323 units
- rounding: 28 units
- enforcement_dates: 21 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
