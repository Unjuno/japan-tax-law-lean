# Normative units — 合計額（課税価格の合計）（1508 units, FULLY_VERIFIED）

Whole norm = summation operator → `FULLY_VERIFIED`. Concrete component values are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| total_amount | 1508 | 合計額 — tax base is the total of component values |

| id | content |
|---|---|
| H | The tax base is the sum of caller-supplied component values; summing is associative and the total of a list is at least any one element. |
| T | `lake build JapanTaxLaw.TotalAmountNormsTests`; `python scripts/ci/source_audit_total.py` |
| D | Kernel proofs of sum nil/singleton/cons/append, element bound and spec agreement (induction); all 1508 originals verbatim (3/3 checks). |
| C | Competing readings rejected: a total omitting a component, a non-zero total on an empty list, and a total below a member value. |
| U | Concrete component values caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
