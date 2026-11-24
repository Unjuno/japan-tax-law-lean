# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 784
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 784 | 396070 |
| VERSION_PINNED | 784 | 396070 |
| STRUCTURE_IDENTIFIED | 781 | 396073 |
| NORM_DECOMPOSED | 783 | 396071 |
| NORMS_FORMALIZED | 784 | 396070 |
| SPEC_IMPL_CORRESPONDENCE | 784 | 396070 |
| BOUNDARY_CHECKED | 784 | 396070 |
| SOURCE_AUDITED | 783 | 396071 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 610 units
- exceptions: 123 units
- effects: 279 units
- delegations: 138 units
- periods: 66 units
- amounts: 210 units
- rounding: 13 units
- enforcement_dates: 10 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
