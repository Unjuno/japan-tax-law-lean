# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 1192
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 1192 | 395662 |
| VERSION_PINNED | 1192 | 395662 |
| STRUCTURE_IDENTIFIED | 1186 | 395668 |
| NORM_DECOMPOSED | 1191 | 395663 |
| NORMS_FORMALIZED | 1192 | 395662 |
| SPEC_IMPL_CORRESPONDENCE | 1192 | 395662 |
| BOUNDARY_CHECKED | 1192 | 395662 |
| SOURCE_AUDITED | 1192 | 395662 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 976 units
- exceptions: 203 units
- effects: 394 units
- delegations: 201 units
- periods: 109 units
- amounts: 319 units
- rounding: 28 units
- enforcement_dates: 18 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
