# Normative units — 定義・省令事項・犯罪・罰金上限（506 units）

| family | units | structure |
|---|---|---|
| ministry_matter | 230 | …その他財務省令で定める事項（外部が与える） |
| definition | 88 | 次の各号に掲げる用語の意義は当該各号に定めるところによる |
| corp_offence | 67 | 行為者＋法人の罰金刑（独立な連言） |
| age_threshold | 35 | 六十五歳以上人口 / 収入金額に占める割合が95%超 |
| penalty_cap | 22 | 三十万/五十万/一百万円以下の罰金上限 |
| question_offence | 20 | 徴税吏員の質問への不答・虚偽答弁 |
| tax_manager_false | 15 | 納税管理人についての虚偽申告＋三十万円以下の罰金 |
| loan_category | 15 | 次のいずれかに該当する金銭の貸付け |
| land_acquire | 14 | 買取りをする者が地方公共団体である場合 |

| id | content |
|---|---|
| H | Definitions are table lookups; ministry matters are externally supplied; age/ratio conditions are threshold comparisons; penalties are bounded by caller-supplied caps; dual fines form an independent conjunction; offence categories are declared structurally. |
| T | `lake build JapanTaxLaw.DefinitionsAndOffencesTests`; `python scripts/ci/source_audit_defoff.py` |
| D | Kernel proofs of definition hit/miss, ministry identity, 65/95 thresholds, offence declarations, false-return disjunction, dual-fine projection, cap boundary/monotonicity and loan/acquirer distinctions; spec agreement; all 506 originals verbatim (4/4 checks). |
| C | Competing readings rejected: ministry content as if in the statute, threshold at/above boundary treated as satisfied, fines above cap, and a single fine for both roles. |
| U | Concrete definitions, amounts, ages, offenders and categories NOT MODELLED. Human legal review pending. |
