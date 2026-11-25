# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 924
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 924 | 395930 |
| VERSION_PINNED | 924 | 395930 |
| STRUCTURE_IDENTIFIED | 919 | 395935 |
| NORM_DECOMPOSED | 923 | 395931 |
| NORMS_FORMALIZED | 924 | 395930 |
| SPEC_IMPL_CORRESPONDENCE | 924 | 395930 |
| BOUNDARY_CHECKED | 924 | 395930 |
| SOURCE_AUDITED | 923 | 395931 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 739 units
- exceptions: 146 units
- effects: 335 units
- delegations: 172 units
- periods: 75 units
- amounts: 255 units
- rounding: 17 units
- enforcement_dates: 12 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
