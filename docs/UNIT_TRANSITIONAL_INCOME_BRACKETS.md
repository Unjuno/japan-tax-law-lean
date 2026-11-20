# Normative units — 329M50000002023 附則4（年額の三区分 × 2）

Six units from the pinned revision `329M50000002023_20261101_508M60000008045`,
Supplementary Provision 4, Article 4(2) quoted table:

| group | normative id (prefix) | 原文 |
|---|---|---|
| T350 | `NORM\|c8d9f6f7…` | 年３５０万円以下の金額　（（２１）） |
| T350 | `NORM\|0a52a897…` | 年３５０万円を超え年７００万円以下の金額　（（２２）） |
| T350 | `NORM\|404d8c3d…` | 年７００万円を超える金額　（（２３）） |
| T300 | `NORM\|7eb3d697…` | 年３００万円以下の金額　（（２１）） |
| T300 | `NORM\|599ebad0…` | 年３００万円を超え年６００万円以下の金額　（（２２）） |
| T300 | `NORM\|91b09e78…` | 年６００万円を超える金額　（（２３）） |

These use the OPPOSITE boundary convention to the art.11 index tables:
「以下」 is upper-INCLUSIVE and 「超え」 is lower-EXCLUSIVE. Conflating the two
conventions is a one-yen boundary error.

| id | content |
|---|---|
| H | T350 partitions `[0,3,500,000]`, `(3,500,000,7,000,000]`, `(7,000,000,∞)`; T300 partitions `[0,3,000,000]`, `(3,000,000,6,000,000]`, `(6,000,000,∞)`. Both cover all d : Nat and are globally pairwise exclusive. |
| T | `lake build JapanTaxLaw.TransitionalIncomeBracketsTests`; `python scripts/ci/source_audit_income_brackets.py` |
| D | Kernel theorems `pickVal_inBand`, `unique_band`, `pairwise_exclusive`, `exhaustive` (per table) plus full spec agreement; all six originals verbatim (3/3 checks, 6/6 hits). |
| C | Competing readings rejected: 「以下」 as 「未満」 excludes the upper edge (3,500,000 / 7,000,000 / 3,000,000 / 6,000,000 wrongly out) and 「超え」 as 「以上」 overlaps at those edges. The two tables' thresholds are not interchangeable. |
| U | d is a caller-established Nat annual amount in yen; the underlying income computation, rates, transitional application conditions and the rest of the article are NOT MODELLED. Human legal review pending. |

Finite index (three per table), universally quantified d — not finite-domain checks.
