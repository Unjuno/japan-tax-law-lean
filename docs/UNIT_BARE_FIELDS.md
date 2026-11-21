# Normative units — 申請欄・期間・数値・列挙導入（7,219 units, PROVED_SCOPE）

| family | units | structure |
|---|---|---|
| form_field | 2,380 | 申請者の氏名、住所… — form field declaration |
| numeric_value | 1,642 | ０～９９，９９９円 etc. — numeric range/value label |
| enumerated_intro | 1,201 | 次に掲げる… — enumeration intro |
| fiscal_year_term | 959 | …対象事業年度 — fiscal-year reference |
| ratio_term | 623 | …割合/共有持分 — ratio/min-selection reference |
| collection_period | 184 | …徴収取扱費算定期間内 — period reference |
| structural_ref | 183 | 第三章第一節（税率） etc. |
| enforcement_window | 47 | 公布の日から起算して二月を経過した日 |

Only structural/reference claims are kernel-proven; actual values and substance
are NOT MODELLED. Unhandled conditions retained → `PROVED_SCOPE`.

| id | content |
|---|---|
| H | These fragments are field declarations, numeric/range labels, enumeration intros or period/structural references; their full content in these units is structural. |
| T | `lake build JapanTaxLaw.BareFieldsAndPeriodsTests`; `python scripts/ci/source_audit_barefields.py` |
| D | Kernel proofs of reference identity, period/range bounds, min-selection and enforcement-window boundary; spec agreement; all 7,219 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a field label or numeric range as a substantive norm, a date outside the stated period/window, and a wrong minimum. |
| U | Actual values and substantive content NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
