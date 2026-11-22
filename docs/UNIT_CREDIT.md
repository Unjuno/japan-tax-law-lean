# Normative units — 外国税額控除・控除残額・配当控除（173 units, FULLY_VERIFIED）

Whole norm = credit operator → `FULLY_VERIFIED`. Concrete amounts are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| foreign_tax_credit | 83 | 外国税額控除 — foreign tax credit |
| unused_credit | 66 | 控除しきれない額 — unused credit carried forward |
| dividend_credit | 24 | 配当控除 — dividend tax credit |

| id | content |
|---|---|
| H | A credit applies as min(tax, credit); an unused credit is credit−tax when in excess; a dividend credit is dividend×rate. |
| T | `lake build JapanTaxLaw.TaxCreditNormsTests`; `python scripts/ci/source_audit_credit.py` |
| D | Kernel proofs of credit under/over, unused covered/excess and dividend zero; spec agreement; all 173 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a credit exceeding the tax, a non-zero unused credit when covered, and non-zero dividend credit on zero dividend. |
| U | Concrete amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
