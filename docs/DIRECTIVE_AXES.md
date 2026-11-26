# Directive §2 — separately tracked verification axes (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/directive_axes.py`.

Eight technical axes are tracked separately; full technical evidence does NOT establish human legal review or whole-article coverage. COMPUTABLE_SLICE_ONLY units are never counted as whole-article norms.

- normative units: 396854
- expanded units (with committed evidence): 957
- independent human legal review axis: `LEGAL_REVIEW_PENDING` (never auto-satisfied)

| axis | achieved units | remaining units |
|---|---:|---:|
| SOURCE_ACQUIRED | 957 | 395897 |
| VERSION_PINNED | 957 | 395897 |
| STRUCTURE_IDENTIFIED | 951 | 395903 |
| NORM_DECOMPOSED | 956 | 395898 |
| NORMS_FORMALIZED | 957 | 395897 |
| SPEC_IMPL_CORRESPONDENCE | 957 | 395897 |
| BOUNDARY_CHECKED | 957 | 395897 |
| SOURCE_AUDITED | 956 | 395898 |

## Normative detail categories recorded separately

Conditions, exceptions, effects, delegations, periods, amounts,
rounding and enforcement dates are recorded in independent fields
(data/DIRECTIVE_AXES.json), never merged into one generic blob.

- conditions: 770 units
- exceptions: 164 units
- effects: 345 units
- delegations: 175 units
- periods: 79 units
- amounts: 262 units
- rounding: 18 units
- enforcement_dates: 12 units

## Reading this ledger

A unit reaching the old `FULLY_VERIFIED` headline is recorded here with all eight technical axes achieved, but it may still be a `COMPUTABLE_SLICE_ONLY` model of a single clause. That is NOT a whole-article or whole-law claim.

Human legal review is a distinct axis. Technical proof, kernel attestation and mechanical source re-extraction cannot advance it; only a recorded human decision can.

Detailed per-unit rows (law id, revision, article, coordinates, scope kind and all nine states) are in `data/DIRECTIVE_AXES.json`.
