# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 786
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 786 | 396068 |
| VERSION_PINNED | 786 | 396068 |
| STRUCTURE_IDENTIFIED | 783 | 396071 |
| NORM_DECOMPOSED | 785 | 396069 |
| NORMS_FORMALIZED | 786 | 396068 |
| SPEC_IMPL_CORRESPONDENCE | 786 | 396068 |
| BOUNDARY_CHECKED | 786 | 396068 |
| SOURCE_AUDITED | 785 | 396069 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 611 units
- exceptions: 124 units
- effects: 280 units
- delegations: 138 units
- periods: 66 units
- amounts: 212 units
- rounding: 13 units
- enforcement_dates: 10 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
