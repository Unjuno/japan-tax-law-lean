# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
<<<<<<< HEAD
- expanded units (with committed evidence): 1105
=======
- expanded units (with committed evidence): 1067
>>>>>>> origin/main
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
<<<<<<< HEAD
| SOURCE_ACQUIRED | 1105 | 395749 |
| VERSION_PINNED | 1105 | 395749 |
| STRUCTURE_IDENTIFIED | 1099 | 395755 |
| NORM_DECOMPOSED | 1104 | 395750 |
| NORMS_FORMALIZED | 1105 | 395749 |
| SPEC_IMPL_CORRESPONDENCE | 1105 | 395749 |
| BOUNDARY_CHECKED | 1105 | 395749 |
| SOURCE_AUDITED | 1104 | 395750 |
=======
| SOURCE_ACQUIRED | 1067 | 395787 |
| VERSION_PINNED | 1067 | 395787 |
| STRUCTURE_IDENTIFIED | 1060 | 395794 |
| NORM_DECOMPOSED | 1066 | 395788 |
| NORMS_FORMALIZED | 1067 | 395787 |
| SPEC_IMPL_CORRESPONDENCE | 1067 | 395787 |
| BOUNDARY_CHECKED | 1067 | 395787 |
| SOURCE_AUDITED | 1066 | 395788 |
>>>>>>> origin/main

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

<<<<<<< HEAD
- conditions: 898 units
- exceptions: 194 units
- effects: 374 units
- delegations: 196 units
- periods: 98 units
- amounts: 299 units
=======
- conditions: 865 units
- exceptions: 187 units
- effects: 368 units
- delegations: 180 units
- periods: 100 units
- amounts: 289 units
>>>>>>> origin/main
- rounding: 28 units
- enforcement_dates: 15 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
