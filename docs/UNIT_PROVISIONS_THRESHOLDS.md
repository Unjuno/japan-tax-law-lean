# Normative units — 読替・施行参照・割合・重量閾値（1,421 units）

Eight repeated §3 families, all dependency-ready:

| family | units | structure |
|---|---|---|
| reading_substitution | 667 | 「A」とあるのは「B」とする / 準用 → token substitution |
| ratio_threshold | 324 | 百分の五十/四十、四分の一以上二分の一未満 → ratio comparison |
| following_provisions | 191 | …適用については次に定めるところによる → structural connector |
| enforcement_reference | 155 | 公布の日の翌日 / 他法の施行の日から施行 → effectiveFrom trigger |
| mutual_application | 31 | 変更する場合も同様とする → parallel application |
| weight_half_ton | 26 | 車両重量〇・五トン以下/超 → 500kg threshold |
| transitional_delegation | 14 | 他法及びこの法律の施行に関し必要な経過措置は政令で定める |
| jurisdiction | 13 | 道府県の区域外においても行うことができる → declaration |

| id | content |
|---|---|
| H | Reading clauses substitute caller-supplied tokens; ratios are compared to thresholds; enforcement references select a date from a trigger; weight splits at 500kg; connectors/delegations/declarations are recorded structurally. |
| T | `lake build JapanTaxLaw.ProvisionsAndThresholdsTests`; `python scripts/ci/source_audit_provthresh.py` |
| D | Kernel proofs of substitution, ratio boundary/exclusivity, effectiveFrom boundary, 500kg complement, reference/delegation identities and jurisdiction declaration; spec agreement; all 1,421 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a wrong substituted token, a ratio on the wrong side of a threshold, enforcement before its trigger, and overlapping weight classes. |
| U | Concrete texts, dates, percentages, weights and targets NOT MODELLED. Human legal review pending. |
