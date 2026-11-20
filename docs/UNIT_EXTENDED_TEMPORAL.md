# Normative units — 追加の施行日・月数規定（435 units）

435 units in 109 variants in two §3 temporal families:
- 公布の日から起算して X を超えない範囲内において政令で定める日から施行する
  (X = 一月/二月/三月/五月/六月/九月/一年/一年三月/一年六月/二年/二年六月/三年/五年/九十日)
- 月数は暦に従って計算し、一月に満たない端数を生じたときは、これを一月とする

| id | content |
|---|---|
| H | Enforcement lies in an open-lower/closed-upper window after promulgation; the month count has a lower bound of one. 超えない/こえない and the 施行日という variants are the same structure. |
| T | `lake build JapanTaxLaw.ExtendedTemporalAndMonthNormsTests`; `python scripts/ci/source_audit_exttemp.py` |
| D | Kernel proofs of window lower/upper bounds, window_of_bounds, bound monotonicity, month lower bound/idempotence/identity and wording-family identity; spec agreement; all 435 originals verbatim (4/4 checks). |
| C | Competing readings rejected: enforcement on/before promulgation, enforcement beyond the stated bound, or a zero-month count. |
| U | Calendar conversion, actual dates and surrounding provisions NOT MODELLED. Human legal review pending. |
