# Normative units — 控除残額・価額設定・床面積（662 units, FULLY_VERIFIED）

Whole norm = amount operator → `FULLY_VERIFIED`. Concrete amounts/areas caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| remainder_after_deduct | 371 | 控除した残額 — total minus deduction |
| floor_area | 221 | 事業所床面積 — area-based tax base |
| value_set | 70 | 価額は…とする — set value to a referenced amount |

| id | content |
|---|---|
| H | A remainder is total−deduction; a value is set to a referenced amount; an area-based base is area×rate; item amounts fold into a sum. |
| T | `lake build JapanTaxLaw.RemainderAndValueNormsTests`; `python scripts/ci/source_audit_remainder.py` |
| D | Kernel proofs of remainder zero/bound, value identity, area zero/identity and sum fold; spec agreement; all 662 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a remainder exceeding the total, a value differing from its reference, and a non-zero base on zero area. |
| U | Concrete amounts/areas caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
