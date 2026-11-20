# Normative units — 325AC0000000226 art.154（第二の最大積載量九区分）

Nine units from a second 最大積載量 table in the pinned revision
`325AC0000000226_20261101_508AC0000000002`, Article 154:
`一トン以下`, `一トン超え二トン以下`, …, `七トン超え八トン以下`, `八トン超えるもの`.

The band structure is identical to the first table (unit group `PayloadCapacityBands`);
the implementation reuses that kernel-proven function, and
`cross_table_inBand` records the extensional identity.

| id | content |
|---|---|
| H | Nine bands `[0,1]`, `(1,2]`, …, `(7,8]`, `(8,∞)` partition payload d (whole tons); exhaustive over all d, globally pairwise exclusive. |
| T | `lake build JapanTaxLaw.PayloadCapacityBandsSecondTableTests`; `python scripts/ci/source_audit_payload_bands2.py` |
| D | Inherited kernel proofs (exhaustiveness, uniqueness, exclusiveness) plus spec agreement and cross-table identity; all nine originals verbatim (3/3 checks, 9/9 hits). |
| C | Competing readings rejected: upper-inclusive 「以下」 vs upper-exclusive 「未満」, lower-exclusive 「超え」 vs lower-inclusive. The two tables share structure but have distinct ids/sources. |
| U | Payload measurement, sub-ton precision, attached rates and legal effect NOT MODELLED. Human legal review pending. |
