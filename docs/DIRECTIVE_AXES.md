# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 712
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 712 | 396142 |
| VERSION_PINNED | 712 | 396142 |
| STRUCTURE_IDENTIFIED | 711 | 396143 |
| NORM_DECOMPOSED | 711 | 396143 |
| NORMS_FORMALIZED | 712 | 396142 |
| SPEC_IMPL_CORRESPONDENCE | 712 | 396142 |
| BOUNDARY_CHECKED | 710 | 396144 |
| SOURCE_AUDITED | 711 | 396143 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 563 units
- exceptions: 114 units
- effects: 231 units
- delegations: 112 units
- periods: 63 units
- amounts: 204 units
- rounding: 9 units
- enforcement_dates: 10 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
