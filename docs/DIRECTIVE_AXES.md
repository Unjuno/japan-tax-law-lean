# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 703
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 703 | 396151 |
| VERSION_PINNED | 703 | 396151 |
| STRUCTURE_IDENTIFIED | 702 | 396152 |
| NORM_DECOMPOSED | 702 | 396152 |
| NORMS_FORMALIZED | 703 | 396151 |
| SPEC_IMPL_CORRESPONDENCE | 703 | 396151 |
| BOUNDARY_CHECKED | 701 | 396153 |
| SOURCE_AUDITED | 702 | 396152 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 557 units
- exceptions: 113 units
- effects: 225 units
- delegations: 110 units
- periods: 62 units
- amounts: 202 units
- rounding: 9 units
- enforcement_dates: 10 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
