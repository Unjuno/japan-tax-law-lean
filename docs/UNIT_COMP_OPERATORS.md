# Normative units — 算定規範の演算子（1,255 units, FULLY_VERIFIED）

Unlike earlier structural-only batches, these clauses' **entire norm** is a
computational operator, so they derive `FULLY_VERIFIED`. The concrete tables,
amounts and units are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| table_calc | 606 | 上欄/中欄/下欄 table-based calculation with unit display |
| rounding | 571 | 端数を切り捨てる / 四捨五入 — rounding operators |
| minmax | 78 | いずれか少ない/多い金額 — min/max selection |

| id | content |
|---|---|
| H | Table calculation scales a value by base/unit; rounding drops or rounds off a remainder; min/max selects from candidate amounts. |
| T | `lake build JapanTaxLaw.ComputationalNormOperatorsTests`; `python scripts/ci/source_audit_compops.py` |
| D | Kernel proofs of scaling (u*3 → 3*base), min/max bounds and selection, round-down divisibility and bound; spec agreement; all 1,255 originals verbatim (4/4 checks). |
| C | Competing readings rejected: wrong scale factor, max selected where min is required, and a non-divisible round-down. |
| U | Concrete tables, amounts and units caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
