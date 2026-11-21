# Normative units — 経過日・期限（1,708 units, FULLY_VERIFIED）

Whole norm = temporal operator → `FULLY_VERIFIED`. Concrete dates/periods caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| elapsed_date | 868 | 「N日を経過する日以後/前」 — date after N elapsed days |
| deem_shall | 525 | 「N以内に終了するものとする」 — deadline to complete |
| elapsed_period | 315 | 「N月を経過した日の前日」 — period boundary |

| id | content |
|---|---|
| H | An elapsed date is start+N; "on/after elapsed day" is date ≥ start+N; "day before" is start+N−1; a deadline requires finish−start ≤ limit. |
| T | `lake build JapanTaxLaw.ElapsedDateNormsTests`; `python scripts/ci/source_audit_elapsed.py` |
| D | Kernel proofs of elapsed zero, after-boundary/far-before, day-before and within-deadline; spec agreement; all 1,708 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a date before the start qualifying as "after elapsed", a zero-period day-before underflow, and completion past the deadline. |
| U | Concrete dates/periods caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
