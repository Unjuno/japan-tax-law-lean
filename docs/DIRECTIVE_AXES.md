# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 756
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 756 | 396098 |
| VERSION_PINNED | 756 | 396098 |
| STRUCTURE_IDENTIFIED | 753 | 396101 |
| NORM_DECOMPOSED | 755 | 396099 |
| NORMS_FORMALIZED | 756 | 396098 |
| SPEC_IMPL_CORRESPONDENCE | 756 | 396098 |
| BOUNDARY_CHECKED | 756 | 396098 |
| SOURCE_AUDITED | 755 | 396099 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 584 units
- exceptions: 116 units
- effects: 265 units
- delegations: 134 units
- periods: 66 units
- amounts: 209 units
- rounding: 13 units
- enforcement_dates: 10 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
