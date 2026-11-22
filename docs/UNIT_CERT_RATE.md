# Normative units — 証明書・書類提出・税率上限（911 units, FULLY_VERIFIED）

Whole norm = verification/rate operator → `FULLY_VERIFIED`. Concrete documents
and rates are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| certificate | 566 | 「証明書の交付を受けていること」 — certificate held |
| doc_submit | 215 | 「書類の提出」 — document submission / deadline extension |
| rate_cap | 130 | 「標準税率／税率で課する」 — rate cap |

| id | content |
|---|---|
| H | A certificate condition tracks whether the document is held; submission is timely iff date ≤ deadline; a deadline may be extended; a rate is within cap iff rate ≤ cap. |
| T | `lake build JapanTaxLaw.CertificateAndRateNormsTests`; `python scripts/ci/source_audit_cert.py` |
| D | Kernel proofs of certificate held/absent, submit at/late deadline, deadline zero-extension and rate at/over cap; spec agreement; all 911 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating an absent certificate as held, a late submission as timely, and a rate above the cap. |
| U | Concrete documents/rates caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
