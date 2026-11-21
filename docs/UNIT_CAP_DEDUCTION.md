# Normative units — 限度・控除・還付・加算（3,144 units, FULLY_VERIFIED）

Whole norm = amount operator → `FULLY_VERIFIED`. Concrete amounts are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| deduction | 1,485 | 控除する／控除した金額 — subtract an amount |
| exemption | 694 | 減税／免税 — zero the tax |
| addition_tax | 543 | 延滞税／加算税／利子税 — additional tax |
| cap | 265 | …を限度とする — cap an amount |
| refund | 157 | 還付する — refund the excess |

| id | content |
|---|---|
| H | A cap is min(amount, cap); deduction subtracts; refund returns paid−tax when positive; exemption zeroes tax; addition tax adds base×rate. |
| T | `lake build JapanTaxLaw.CapDeductionRefundNormsTests`; `python scripts/ci/source_audit_cap.py` |
| D | Kernel proofs of cap under/over/bounded, deduction bounds, refund excess/none, exemption zero and addition zero-rate; spec agreement; all 3,144 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a cap exceeding the limit, a negative deduction/refund, and tax not zeroed under an exemption. |
| U | Concrete amounts/rates caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
