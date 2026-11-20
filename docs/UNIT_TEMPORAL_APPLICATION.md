# Normative units — 新旧法の時間的適用と付随規範（808 units）

Eleven repeated §3 families, all dependency-ready:

| family | units | structure |
|---|---|---|
| new_old_application | 223 | 施行日以後は新法、施行日前はなお従前の例 |
| prior_penalty | 130 | 施行前行為＋附則で従前の例とされる施行後行為の罰則 |
| prior_national_penalty | 108 | 施行前の国税違反行為＋従前の例とされる施行後行為の罰則 |
| qualification_date | 87 | 該当することとなつた日以后の過去適用事業年度の扱い |
| quasi_corp_rep | 40 | 人格のない社団等の代表者が訴訟行為を代表 |
| certificate | 26 | 国土交通大臣が財務大臣と協議して定める工事の証明書類 |
| transitional_two_articles | 24 | 前二条に規定するもののほか…政令で定める |
| government_study | 22 | 納税環境整備に向けた検討（構造記録） |
| transitional_three_articles | 21 | 前三条に定めるもののほか…政令で定める |
| special_depreciation_ref | 21 | 同項に規定する特別償却限度額への参照 |
| object_presentation | 20 | 物件提示要求への不応・虚偽記載 |
| limitation_follows | 19 | 法人罰金の時効期間は本罪の時効による |
| quasi_foundation_rep | 17 | 法人でない社団等の代表者が代表 |
| transitional_supplement | 17 | 附則に規定するもののほか…政令で定める |
| case_designation | 17 | （2）（i）に掲げる場合への参照 |
| inspection_refusal | 16 | 帳簿書類等の検査の拒否・妨害・忌避 |

| id | content |
|---|---|
| H | New law applies at/after enforcement and old law before it, exclusively and totally; pre-enforcement acts carry old penalties; limitation follows the principal offence; transitional content and representation targets are supplied externally. |
| T | `lake build JapanTaxLaw.TemporalApplicationRulesTests`; `python scripts/ci/source_audit_temporal2.py` |
| D | Kernel proofs: new-law-at-enforcement, new/old exclusivity and totality, prior-penalty before/from-enforcement, limitation identity, from-date boundary, delegation identity, representative-vs-entity, declaration/requirement records, obstruction cases and reference identities; spec agreement; all 808 originals verbatim (4/4 checks). |
| C | Competing readings rejected: both laws applying at once, neither applying, old penalty for post-enforcement acts, entity representing itself, treating a study directive as a binding norm. |
| U | Concrete dates, taxpayers, offences, amounts and delegated content NOT MODELLED. Human legal review pending. |
