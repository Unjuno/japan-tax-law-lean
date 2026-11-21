# Normative units — 義務・許可・禁止・記録（5,279 units, FULLY_VERIFIED）

Whole norm = deontic modality → `FULLY_VERIFIED`. Concrete actions are
caller-supplied and NOT MODELLED. Distinct from the earlier procedural/deontic
batch (approval/notification/payment/security).

| family | units | structure |
|---|---|---|
| must | 2,795 | 「…しなければならない」 — obligation |
| permit | 1,518 | 「…することができる」 — permission |
| keep_records | 515 | record-keeping obligation |
| prohibit | 256 | 「…してはならない」 — prohibition |
| notice_duty | 135 | notification obligation |
| report_duty | 60 | reporting obligation |

| id | content |
|---|---|
| H | Obligations and prohibitions track whether the caller-supplied action occurred; permission distinguishes allowed/forbidden; obligation, permission and prohibition are distinct modalities. |
| T | `lake build JapanTaxLaw.DeonticModalityNormsTests`; `python scripts/ci/source_audit_modality.py` |
| D | Kernel proofs of obligation kept/broken, permission allowed/forbidden, prohibition violated/respected and modality distinctness; spec agreement; all 5,279 originals verbatim (4/4 checks). |
| C | Competing readings rejected: conflating permission with obligation, treating a forbidden act as permitted, and equating distinct modalities. |
| U | Concrete actions caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
