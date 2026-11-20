# Normative units — 337M50000008017 art.11（昼間流入人口の六区分）

Six units from the pinned revision `337M50000008017_20260724_508M60000008092`,
Article 11 Paragraph 1 Item 1 Subitem1 #1 Subitem2 #4 table:

| index | normative id (prefix) | 原文 |
|---|---|---|
| 0 | `NORM\|40c24a25…` | １，０００人以上６，０００人未満 |
| 1 | `NORM\|eaedffec…` | ６，０００人以上１１，０００人未満 |
| 2 | `NORM\|6db85135…` | １１，０００人以上５５，０００人未満 |
| 3 | `NORM\|4c4a2318…` | ５５，０００人以上１１０，０００人未満 |
| 4 | `NORM\|7a48513b…` | １１０，０００人以上２２０，０００人未満 |
| 5 | `NORM\|ade181c2…` | ２２０，０００人以上 |

| id | content |
|---|---|
| H | The six rows partition daytime population counts `d >= 1,000`: `[1000,6000)`, `[6000,11000)`, `[11000,55000)`, `[55000,110000)`, `[110000,220000)`, `[220000,∞)`. 「以上」 lower-inclusive, 「未満」 upper-exclusive. Global pairwise exclusivity; exhaustive for `d >= 1,000`. |
| T | `lake build JapanTaxLaw.LocalGrantPopulationBandsTests`; `python scripts/ci/source_audit_population_bands.py` |
| D | Kernel theorems `pickVal_inBand`, `unique_band`, `pairwise_exclusive`, `exhaustive` plus full spec agreement; all six originals verbatim (3/3 checks, 6/6 hits). |
| C | Competing readings rejected: 「未満」 as 「以下」 overlaps at 6,000/11,000/55,000/110,000/220,000; 「以上」 as 「超え」 leaves gaps. The first row starts at 1,000, so `d < 1,000` is explicitly NOT MODELED rather than silently covered. |
| U | d is a caller-established Nat population count; the underlying census derivation, formulas, rounding and the rest of Article 11 are NOT MODELLED. Human legal review pending. |

Finite index (six), universally quantified d — not a finite-domain check.
