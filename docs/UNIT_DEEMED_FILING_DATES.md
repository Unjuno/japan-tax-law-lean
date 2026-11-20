# Normative units — 325AC0000000073 art.39/42（記載日の擬制）

Six DEEMING units from the pinned revision `325AC0000000073_20260401_506AC0000000008`:

| group | normative id (prefix) | article/paragraph | 原文（要旨） |
|---|---|---|---|
| A | `NORM\|5336c555…` | 39(6) | 提出する日が記載されていないときは…みなす |
| B | `NORM\|f37de1f3…` | 39(13) | 訂正又は提出をする日が…みなす |
| A | `NORM\|fa376921…` | 39(18) | 提出する日が…みなす |
| A | `NORM\|7e775794…` | 42(4) | 提出する日が…みなす |
| B | `NORM\|4b7f57cf…` | 42(11) | 訂正又は提出をする日が…みなす |
| C | `NORM\|f8c24193…` | 42(23) | 措置をとる日が…みなす |

| id | content |
|---|---|
| H | If no date is written, a caller-supplied deemed date (reference + 3 months) is treated as written; otherwise the written date applies. The three text patterns (提出する日 / 訂正又は提出をする日 / 措置をとる日) implement the same branch structure. |
| T | `lake build JapanTaxLaw.DeemedFilingDatesTests`; `python scripts/ci/source_audit_deemed_dates.py` |
| D | Kernel theorems for written/deemed branches, branch exhaustiveness, totality, and extensional identity of the three rules; spec agreement; all six originals verbatim (4/4 checks, 6/6 hits). |
| C | Competing reading rejected: treating the deemed date as overriding an explicitly written date (the 「記載されていないとき」 condition is ignored) reverses the rule. The 3-month calendar computation is NOT in these fragments. |
| U | The written date, the deemed date and their calendar computation (三月を経過する日), the underlying filing procedure and legal effect are NOT MODELLED. Human legal review pending. |

This verifies the *conditional-deeming structure*, not calendar arithmetic or filing procedure.
