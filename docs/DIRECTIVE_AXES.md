# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 822
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 822 | 396032 |
| VERSION_PINNED | 822 | 396032 |
| STRUCTURE_IDENTIFIED | 817 | 396037 |
| NORM_DECOMPOSED | 821 | 396033 |
| NORMS_FORMALIZED | 822 | 396032 |
| SPEC_IMPL_CORRESPONDENCE | 822 | 396032 |
| BOUNDARY_CHECKED | 822 | 396032 |
| SOURCE_AUDITED | 821 | 396033 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 642 units
- exceptions: 131 units
- effects: 292 units
- delegations: 144 units
- periods: 73 units
- amounts: 231 units
- rounding: 16 units
- enforcement_dates: 10 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
