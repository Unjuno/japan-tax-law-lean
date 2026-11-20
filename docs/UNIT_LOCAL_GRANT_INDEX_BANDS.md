# Normative units — 337M50000008017 art.11（指数区分 C・E）

Nine units from two full-coverage index tables in the pinned revision
`337M50000008017_20260724_508M60000008092`:

| group | index | normative id (prefix) | 原文 |
|---|---|---|---|
| C | 0 | `NORM\|7b9430e4…` | １００未満 |
| C | 1 | `NORM\|a67969e1…` | １００以上２００未満 |
| C | 2 | `NORM\|6dd5ac03…` | ２００以上３００未満 |
| C | 3 | `NORM\|f4810723…` | ３００以上 |
| E | 0 | `NORM\|3664fff4…` | １０未満 |
| E | 1 | `NORM\|98df7397…` | １０以上１１０未満 |
| E | 2 | `NORM\|09f22cf7…` | １１０以上２２０未満 |
| E | 3 | `NORM\|92f0b0ef…` | ２２０以上３３０未満 |
| E | 4 | `NORM\|6039062b…` | ３３０以上 |

Unlike the previous amount table (whose first row started at 3,000), both of
these tables start at 0 (「１００未満」/「１０未満」), so they are exhaustive over
**all** `d : Nat`. They remain independent: C uses thresholds 100/200/300, E
uses 10/110/220/330.

| id | content |
|---|---|
| H | C partitions d into `[0,100)`, `[100,200)`, `[200,300)`, `[300,∞)`; E into `[0,10)`, `[10,110)`, `[110,220)`, `[220,330)`, `[330,∞)`. 「以上」 lower-inclusive, 「未満」 upper-exclusive; both cover all d. |
| T | `lake build JapanTaxLaw.LocalGrantIndexBandsTests`; `python scripts/ci/source_audit_local_grant_index.py` |
| D | Kernel theorems (per group) `pickVal_inBand`, `unique_band`, `pairwise_exclusive`, `exhaustive`, plus full spec agreement; all nine originals verbatim (3/3 checks, 9/9 hits). |
| C | Competing readings rejected: treating 「未満」 as 「以下」 creates overlaps at 100/200/300 (C) and 10/110/220/330 (E); treating 「以上」 as 「超え」 creates gaps. The two tables' thresholds are not interchangeable. |
| U | d is a caller-established Nat index; the underlying index computations, the formulas attached to each row, rounding and the rest of Article 11 are NOT MODELLED. Human legal review pending. |

Finite index sets (4 and 5), universally quantified d — not finite-domain checks.

## Honest status split
The queue classifies the two first-band units (`NORM|7b9430e4…` 「１００未満」 and
`NORM|3664fff4…` 「１０未満」) as **PROVED_SCOPE**, not FULLY_VERIFIED: their
fragments are bare inequalities with no explicit subject, so the decomposer
records an unhandled condition (the compared quantity is caller-supplied). The
other seven units are FULLY_VERIFIED. This distinction is preserved deliberately;
the model's exhaustiveness claim is conditional on `d` being the intended index.
