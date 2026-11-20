# Normative units — 337M50000008017 art.11（距離 A・経済構造 B）

Seven units from the pinned revision `337M50000008017_20260724_508M60000008092`:

| group | normative id (prefix) | 原文 |
|---|---|---|
| A | `NORM\|9d68bfc6…` | ２００点以上３５０点未満 |
| A | `NORM\|da72ca21…` | ３５０点以上６５０点未満 |
| A | `NORM\|7879e9d6…` | ６５０点以上９５０点未満 |
| A | `NORM\|af0d7db1…` | ９５０点以上９９０点未満 |
| A | `NORM\|92ee405d…` | ９９０点以上 |
| B | `NORM\|e664b371…` | ９６未満 |
| B | `NORM\|8e1a5487…` | ９６以上 |

A （距離） is exhaustive for `d >= 200`; `d < 200` is explicitly NOT MODELLED.
B （経済構造） is exhaustive over all `d`.

| id | content |
|---|---|
| H | A partitions `[200,350)`, `[350,650)`, `[650,950)`, `[950,990)`, `[990,∞)`; B partitions `[0,96)`, `[96,∞)`. 「以上」 lower-inclusive, 「未満」 upper-exclusive; global pairwise exclusivity in both. |
| T | `lake build JapanTaxLaw.LocalGrantRemainingBandsTests`; `python scripts/ci/source_audit_remaining_bands.py` |
| D | Kernel theorems `pickVal_inBand`, `unique_band`, `pairwise_exclusive`, `exhaustive` (per group) plus full spec agreement; all seven originals verbatim (3/3 checks, 7/7 hits). |
| C | Competing readings rejected: 「未満」 as 「以下」 creates overlaps at 350/650/950/990 (A) and 96 (B); 「以上」 as 「超え」 creates gaps. A's lower edge 200 is recorded, not silently extended. |
| U | d is a caller-established Nat index; the underlying point computations, formulas, rounding and the rest of Article 11 are NOT MODELLED. Human legal review pending. |

## Honest status split
The queue classifies B's first band (`NORM|e664b371…` 「９６未満」) as
**PROVED_SCOPE** — its bare inequality names no explicit subject (unhandled
condition). It is not claimed as FULLY_VERIFIED. The other six units are
FULLY_VERIFIED. Finite indices (5 and 2), universally quantified d.
