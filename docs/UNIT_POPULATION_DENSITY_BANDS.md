# Normative units — 処理区域内人口密度の四区分（36 units）

36 units from three pinned 2026-11 snapshots:
- 505M60000008043 art.2 (item 3 / item 5 / item 35)
- 507M60000008043 art.2 (item 3 / item 5 / item 41)
- 508M60000008066 art.2 (item 3 / item 5 / item 45)

All express the same four-band partition of 処理区域内人口密度
(persons per hectare): `[25,50) [50,75) [75,100) [100,∞)`.

| id | content |
|---|---|
| H | The four bands are jointly exhaustive for `d >= 25` (the first band's lower edge) and globally pairwise exclusive. The nine source groups (3 laws × 3 items) share one structurally identical band function. |
| T | `lake build JapanTaxLaw.PopulationDensityBandsTests`; `python scripts/ci/source_audit_density_bands.py` |
| D | Kernel proofs of bounded exhaustiveness, uniqueness, exclusiveness plus cross-group identity theorems; spec agreement; all 36 originals verbatim (4/4 checks, 36/36 hits). |
| C | Competing readings rejected: upper-exclusive 「未満」 as inclusive, lower-inclusive 「以上」 as exclusive, and treating the last band as bounded at 100. d<25 is explicitly outside the table. |
| U | Density measurement, the calculation using these bands and legal effect NOT MODELLED. Human legal review pending. |

Finite index (four), universally quantified d within the recorded domain — not a finite-domain check.
