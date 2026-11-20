# Normative units — 端数処理（238 units）

238 units in 143 verbatim variants expressing two §3 rounding operations:
四捨五入 (round half up) and 切り捨て (truncate/floor), at units such as 整数,
小数点以下3位, 百円, 千円, 百分の十, 一月.

| id | content |
|---|---|
| H | Both operations map a value to a multiple of a caller-supplied unit `u`: floor = `x/u*u` (never above x, monotone); round-half-up = `(x+u/2)/u*u` (nearest multiple, ties up). |
| T | `lake build JapanTaxLaw.RoundingRulesTests`; `python scripts/ci/source_audit_rounding.py` |
| D | Kernel proofs of floor bound, multiple-of-unit, monotonicity, integer identity, and identity of all wording variants; spec agreement; all 238 originals verbatim (4/4 checks). |
| C | Competing readings rejected: 四捨五入 as truncation, ties rounded down, or treating 百円/千円/小数点以下3位 as interchangeable units. |
| U | Specific amounts, rates and formulas surrounding each rounding rule NOT MODELLED; the unit and value are caller-supplied. Human legal review pending. |
