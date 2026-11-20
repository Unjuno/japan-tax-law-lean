# Normative units — 337M50000008017 art.11（金額の六区分）

Six units, one per table row of Article 11 Paragraph 1 Item 1 in the pinned
revision `337M50000008017_20260724_508M60000008092`:

| index | normative id (prefix) | 原文 |
|---|---|---|
| 0 | `NORM\|61c9a21e…` | ３，０００以上２５，０００未満 |
| 1 | `NORM\|aefa93fb…` | ２５，０００以上５０，０００未満 |
| 2 | `NORM\|5b0720b9…` | ５０，０００以上１００，０００未満 |
| 3 | `NORM\|4e4cbc37…` | １００，０００以上４００，０００未満 |
| 4 | `NORM\|eafb926a…` | ４００，０００以上９００，０００未満 |
| 5 | `NORM\|7747547b…` | ９００，０００以上 |

| id | content |
|---|---|
| H | The six rows partition amounts `d >= 3,000`: `[3000,25000)`, `[25000,50000)`, `[50000,100000)`, `[100000,400000)`, `[400000,900000)`, `[900000,∞)`. 「以上」 is lower-inclusive, 「未満」 is upper-exclusive. No two rows overlap. |
| T | `lake build JapanTaxLaw.LocalGrantAmountBandsTests`; `python scripts/ci/source_audit_local_grant_bands.py` |
| D | Kernel theorems `pickVal_inBand` (exhaustive for `d >= 3,000`), `unique_band` and `pairwise_exclusive` (global), plus spec agreement; all six originals found verbatim (3/3 checks, 6/6 hits). |
| C | Competing readings rejected: 「未満」 as 「以下」 (would overlap at 25,000/50,000/…/900,000) and 「以上」 as 「超え」 (would leave gaps). Note the first row starts at 3,000 — the table does **not** cover `d < 3,000`, which is recorded as out of scope rather than silently assumed. |
| U | Amount is a caller-established Nat in yen; the underlying amount computation, the rates/effects attached to the bands and the rest of Article 11 are NOT MODELLED. `d < 3,000` is NOT MODELLED. Human legal review pending. |

This is a finite-index (six rows) proof with universally quantified `d`, not a
finite-domain check. It verifies the partition, not the article's computation.
