# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 961
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 961 | 395893 |
| VERSION_PINNED | 961 | 395893 |
| STRUCTURE_IDENTIFIED | 955 | 395899 |
| NORM_DECOMPOSED | 960 | 395894 |
| NORMS_FORMALIZED | 961 | 395893 |
| SPEC_IMPL_CORRESPONDENCE | 961 | 395893 |
| BOUNDARY_CHECKED | 961 | 395893 |
| SOURCE_AUDITED | 960 | 395894 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 774 units
- exceptions: 164 units
- effects: 349 units
- delegations: 175 units
- periods: 79 units
- amounts: 261 units
- rounding: 18 units
- enforcement_dates: 12 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
