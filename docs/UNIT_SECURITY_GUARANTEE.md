# Normative units — 担保・保証（265 units, FULLY_VERIFIED）

Whole norm = secured-obligation operator → `FULLY_VERIFIED`. Concrete amounts
and parties are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| security_amount | 180 | 延納担保 — security for a deferred amount |
| guarantee | 70 | 政府保証/保証人 — guarantee of an obligation |
| security_order | 15 | 担保を提供させることができる — permission to require security |

| id | content |
|---|---|
| H | Security equals the deferred amount; requiring security is permitted when authorized; a guarantor pays only if the principal defaults; installment = total/times. |
| T | `lake build JapanTaxLaw.SecurityGuaranteeNormsTests`; `python scripts/ci/source_audit_security.py` |
| D | Kernel proofs of security identity, permission authorized/unauthorized, guarantee principal-default branch and installment zero/division; spec agreement; all 265 originals verbatim (4/4 checks). |
| C | Competing readings rejected: security without authorization, a guarantor paying despite principal payment, and division by zero installments. |
| U | Concrete amounts/parties caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
