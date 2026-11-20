# Normative units — 325AC0000000226 art.154（最大積載量の九区分）

Nine units from the pinned revision `325AC0000000226_20261101_508AC0000000002`,
Article 154 最大積載量 table （１）〜（９）:
`一トン以下`, `一トン超え二トン以下`, …, `七トン超え八トン以下`, `八トン超えるもの`.

| id | content |
|---|---|
| H | The nine rows partition payload d (tons, Nat): `[0,1]`, `(1,2]`, …, `(7,8]`, `(8,∞)`. 「超え」 lower-exclusive, 「以下」 upper-inclusive. First band includes 0/1, last is open-ended, so all d are covered. |
| T | `lake build JapanTaxLaw.PayloadCapacityBandsTests`; `python scripts/ci/source_audit_payload_bands.py` |
| D | Kernel `pickVal_inBand` (exhaustive over all d), `unique_band`, `pairwise_exclusive`, spec agreement; all nine originals verbatim (3/3 checks, 9/9 hits). |
| C | Competing readings rejected: 「以下」 as 「未満」 leaves gaps at 1..8; 「超え」 as 「以上」 overlaps. d is in whole tons — sub-ton precision is NOT MODELLED. |
| U | The payload measurement, sub-ton precision, tax rates attached to each band and the rest of Article 154 are NOT MODELLED. Human legal review pending. |

Finite index (nine), universally quantified d — not a finite-domain check.
