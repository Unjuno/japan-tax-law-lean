# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1099
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1099 | 395755 |
| VERSION_PINNED | 1099 | 395755 |
| STRUCTURE_IDENTIFIED | 1093 | 395761 |
| NORM_DECOMPOSED | 1098 | 395756 |
| NORMS_FORMALIZED | 1099 | 395755 |
| SPEC_IMPL_CORRESPONDENCE | 1099 | 395755 |
| BOUNDARY_CHECKED | 1099 | 395755 |
| SOURCE_AUDITED | 1099 | 395755 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 894 units
- exceptions: 193 units
- effects: 377 units
- delegations: 195 units
- periods: 103 units
- amounts: 305 units
- rounding: 28 units
- enforcement_dates: 15 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
