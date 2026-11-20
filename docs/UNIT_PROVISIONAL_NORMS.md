# Normative units — 暫定的規範と付随ラベル（425 units）

Ten repeated §3 families (all dependency-ready, no unhandled conditions):

| family | units | structure |
|---|---|---|
| subitem | 162 | 一の二 … 四十の二 → (ordinal, sub) pair, parsed by kernel-checked kanji parser |
| amount_bracket | 51 | 五十万円以下の部分等 → interval membership |
| weight | 36 | 車両総重量が一トン以下/超 → threshold comparison, exclusive/complementary |
| yomikae_label | 35 | 読み替える/読み替えられる字句 → active/passive role |
| formula | 28 | 次の算式によって算定した額とする → formula application |
| quote_close | 26 | 」とする。 → quotation-close connector |
| prior_penalty | 23 | 施行前の行為 → old law applies iff act time < enforcement |
| exempt | 22 | 情状により刑を免除することができる → MAY, explicitly not MUST |
| definitions | 22 | 次の各号に掲げる用語の意義は… → definition lookup |
| prev_ref | 20 | 前条第一項 → previous-article reference |

| id | content |
|---|---|
| H | Each fragment has a small, caller-parametrised structure: ordinal pairs, intervals, thresholds, roles, formula application, references, temporal penalty selection, definition lookup and discretionary (not mandatory) permission. |
| T | `lake build JapanTaxLaw.ProvisionalNormsAndLabelsTests`; `python scripts/ci/source_audit_prov.py` |
| D | Kernel proofs: sub-item parsing (20 variants), formula/connector identity, role distinctness, definition lookup hit/miss, old-law-before/new-law-from-enforcement, bracket bounds, weight complement/exclusivity, may≠must; spec agreement; all 425 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating exemption permission as an obligation, applying old law to post-enforcement acts, overlapping weight classes, wrong sub-item ordinal, wrong-target reference. |
| U | Concrete amounts, offences, formulas and referenced provisions NOT MODELLED. Human legal review pending. |
