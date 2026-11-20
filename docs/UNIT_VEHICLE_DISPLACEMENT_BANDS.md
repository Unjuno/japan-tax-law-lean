# Normative units — 325AC0000000226 art.154（総排気量の十区分）

Ten units, one per table row （１）〜（１０） of the pinned Article 154
Paragraph 1 table (revision `325AC0000000226_20261101_508AC0000000002`):

| index | normative id (prefix) | 原文 |
|---|---|---|
| 0 | `NORM\|e742f1b1…` | 一リットル以下 |
| 1 | `NORM\|bfbe2363…` | 一リットル超え一・五リットル以下 |
| 2 | `NORM\|fbaae7be…` | 一・五リットル超え二リットル以下 |
| 3 | `NORM\|9dd7250f…` | 二リットル超え二・五リットル以下 |
| 4 | `NORM\|549b313a…` | 二・五リットル超え三リットル以下 |
| 5 | `NORM\|bcf1ebb6…` | 三リットル超え三・五リットル以下 |
| 6 | `NORM\|9eef220e…` | 三・五リットル超え四リットル以下 |
| 7 | `NORM\|1b70bd69…` | 四リットル超え四・五リットル以下 |
| 8 | `NORM\|8c20a306…` | 四・五リットル超え六リットル以下 |
| 9 | `NORM\|01d4d7b4…` | 六リットル超え |

| id | content |
|---|---|
| H | The ten rows partition total engine displacement: `d<=10`, `10<d<=15`, …, `45<d<=60`, `60<d` in decilitres. 「以下」 is upper-inclusive; 「超え」 is lower-exclusive. No two rows overlap; every d falls in exactly one. |
| T | `lake build JapanTaxLaw.VehicleDisplacementBandsTests`; `python scripts/ci/source_audit_vehicle_bands.py` |
| D | Kernel theorems `pickVal_inBand` (exhaustive), `unique_band` and `pairwise_exclusive` (pairwise exclusivity over universally quantified d), plus full spec agreement; all ten originals found verbatim (3/3 audit checks, 10/10 hits). |
| C | Competing readings rejected: 「以下」 as 「未満」 (upper-exclusive) and 「超え」 as 「以上」 (lower-inclusive) would leave gaps/overlaps at 10/15/…/60. The shared decilitre encoding avoids rounding 1.5/2.5/4.5; treating those as floats would introduce boundary errors. |
| U | Displacement is caller-established Nat in decilitres; measurement/rounding from engine specs, the tax rates attached to each band, vehicle categories, exemptions and the rest of Article 154 are NOT MODELLED. Human legal review pending. |

This verifies the ten-row partition, not the article's tax computation. Case
analysis is over the ten fixed indices; `d : Nat` remains universally quantified,
so this is not a finite-domain check.
