# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 876
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 876 | 395978 |
| VERSION_PINNED | 876 | 395978 |
| STRUCTURE_IDENTIFIED | 871 | 395983 |
| NORM_DECOMPOSED | 875 | 395979 |
| NORMS_FORMALIZED | 876 | 395978 |
| SPEC_IMPL_CORRESPONDENCE | 876 | 395978 |
| BOUNDARY_CHECKED | 876 | 395978 |
| SOURCE_AUDITED | 875 | 395979 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 695 units
- exceptions: 136 units
- effects: 318 units
- delegations: 169 units
- periods: 73 units
- amounts: 243 units
- rounding: 16 units
- enforcement_dates: 12 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
