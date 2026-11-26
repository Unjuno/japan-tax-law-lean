# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
<<<<<<< HEAD
- expanded units (with committed evidence): 1112
=======
- expanded units (with committed evidence): 1111
>>>>>>> origin/main
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
<<<<<<< HEAD
| SOURCE_ACQUIRED | 1112 | 395742 |
| VERSION_PINNED | 1112 | 395742 |
| STRUCTURE_IDENTIFIED | 1106 | 395748 |
| NORM_DECOMPOSED | 1111 | 395743 |
| NORMS_FORMALIZED | 1112 | 395742 |
| SPEC_IMPL_CORRESPONDENCE | 1112 | 395742 |
| BOUNDARY_CHECKED | 1112 | 395742 |
| SOURCE_AUDITED | 1112 | 395742 |
=======
| SOURCE_ACQUIRED | 1111 | 395743 |
| VERSION_PINNED | 1111 | 395743 |
| STRUCTURE_IDENTIFIED | 1105 | 395749 |
| NORM_DECOMPOSED | 1110 | 395744 |
| NORMS_FORMALIZED | 1111 | 395743 |
| SPEC_IMPL_CORRESPONDENCE | 1111 | 395743 |
| BOUNDARY_CHECKED | 1111 | 395743 |
| SOURCE_AUDITED | 1111 | 395743 |
>>>>>>> origin/main

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

<<<<<<< HEAD
- conditions: 904 units
=======
- conditions: 903 units
>>>>>>> origin/main
- exceptions: 194 units
- effects: 378 units
- delegations: 197 units
- periods: 102 units
- amounts: 299 units
- rounding: 28 units
- enforcement_dates: 15 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
