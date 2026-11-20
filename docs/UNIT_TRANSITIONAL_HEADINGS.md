# Normative units — 経過措置見出し・施行日式・省令委任（2092 units）

2092 dependency-ready units in three §3 structural families:

| family | count | variants | structure |
|---|---|---|---|
| heading | 1856 | 598 | （〜に関する経過措置） — section heading declaring transitional provisions |
| date_expr | 183 | 22 | 公布の日から起算して X を超えない範囲内において政令で定める日 (no 施行する) |
| ministry_deleg | 53 | 1 | その他財務省令で定める事項 |

| id | content |
|---|---|
| H | A 経過措置 heading declares that transitional provisions follow; a bounded date expression selects a day in (promulgate, promulgate+bound]; ministry matters are supplied externally. |
| T | `lake build JapanTaxLaw.TransitionalHeadingsAndDateExprsTests`; `python scripts/ci/source_audit_transhead.py` |
| D | Kernel proofs of heading declaration, date lower/upper bounds, date_of_bounds, bound monotonicity, ministry delegation identity and family distinctness; spec agreement; all 2092 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a heading treated as a norm with its own effect, a chosen date on/before promulgation or beyond the bound, and treating delegated ministry content as stated in the statute. |
| U | Actual heading texts, bounds and delegated content NOT MODELLED. Human legal review pending. |
