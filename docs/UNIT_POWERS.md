# Normative units — 公権限・控除限度額（1,733 units, FULLY_VERIFIED）

Whole norm = deontic/amount operator → `FULLY_VERIFIED`. Concrete officials and
amounts caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| registration_request | 1,261 | 「登記を嘱託する」 — official registration commission |
| commissioner_power | 247 | 「税務署長は…できる」 — discretionary official power |
| deduction_limit | 225 | 「控除限度額」 — deduction cap |

| id | content |
|---|---|
| H | A discretionary power is exercisable when needed; a registration commission is possible when required documents are complete; a deduction cap is min(amount, limit). |
| T | `lake build JapanTaxLaw.OfficialPowersAndLimitsTests`; `python scripts/ci/source_audit_powers.py` |
| D | Kernel proofs of power-when-needed, commission-when-docs-complete and cap under/over; spec agreement; all 1,733 originals verbatim (4/4 checks). |
| C | Competing readings rejected: power exercised without need, commission without documents, and a deduction exceeding the cap. |
| U | Concrete officials/amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
