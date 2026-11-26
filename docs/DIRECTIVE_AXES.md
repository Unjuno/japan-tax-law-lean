# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
<<<<<<< HEAD
- expanded units (with committed evidence): 1099
=======
- expanded units (with committed evidence): 1089
>>>>>>> origin/main
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
<<<<<<< HEAD
| SOURCE_ACQUIRED | 1099 | 395755 |
| VERSION_PINNED | 1099 | 395755 |
| STRUCTURE_IDENTIFIED | 1093 | 395761 |
| NORM_DECOMPOSED | 1098 | 395756 |
| NORMS_FORMALIZED | 1099 | 395755 |
| SPEC_IMPL_CORRESPONDENCE | 1099 | 395755 |
| BOUNDARY_CHECKED | 1099 | 395755 |
| SOURCE_AUDITED | 1099 | 395755 |
=======
| SOURCE_ACQUIRED | 1089 | 395765 |
| VERSION_PINNED | 1089 | 395765 |
| STRUCTURE_IDENTIFIED | 1083 | 395771 |
| NORM_DECOMPOSED | 1088 | 395766 |
| NORMS_FORMALIZED | 1089 | 395765 |
| SPEC_IMPL_CORRESPONDENCE | 1089 | 395765 |
| BOUNDARY_CHECKED | 1089 | 395765 |
| SOURCE_AUDITED | 1088 | 395766 |
>>>>>>> origin/main

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

<<<<<<< HEAD
- conditions: 894 units
=======
- conditions: 887 units
>>>>>>> origin/main
- exceptions: 193 units
- effects: 377 units
- delegations: 195 units
<<<<<<< HEAD
- periods: 103 units
- amounts: 305 units
- rounding: 28 units
- enforcement_dates: 15 units
=======
- periods: 101 units
- amounts: 301 units
- rounding: 29 units
- enforcement_dates: 16 units
>>>>>>> origin/main

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
