# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
<<<<<<< HEAD
- expanded units (with committed evidence): 1082
=======
- expanded units (with committed evidence): 1031
>>>>>>> origin/main
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
<<<<<<< HEAD
| SOURCE_ACQUIRED | 1082 | 395772 |
| VERSION_PINNED | 1082 | 395772 |
| STRUCTURE_IDENTIFIED | 1075 | 395779 |
| NORM_DECOMPOSED | 1081 | 395773 |
| NORMS_FORMALIZED | 1082 | 395772 |
| SPEC_IMPL_CORRESPONDENCE | 1082 | 395772 |
| BOUNDARY_CHECKED | 1082 | 395772 |
| SOURCE_AUDITED | 1081 | 395773 |
=======
| SOURCE_ACQUIRED | 1031 | 395823 |
| VERSION_PINNED | 1031 | 395823 |
| STRUCTURE_IDENTIFIED | 1024 | 395830 |
| NORM_DECOMPOSED | 1030 | 395824 |
| NORMS_FORMALIZED | 1031 | 395823 |
| SPEC_IMPL_CORRESPONDENCE | 1031 | 395823 |
| BOUNDARY_CHECKED | 1031 | 395823 |
| SOURCE_AUDITED | 1030 | 395824 |
>>>>>>> origin/main

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

<<<<<<< HEAD
- conditions: 876 units
- exceptions: 189 units
- effects: 371 units
- delegations: 182 units
- periods: 98 units
- amounts: 288 units
- rounding: 28 units
=======
- conditions: 837 units
- exceptions: 185 units
- effects: 364 units
- delegations: 176 units
- periods: 95 units
- amounts: 272 units
- rounding: 27 units
>>>>>>> origin/main
- enforcement_dates: 15 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
