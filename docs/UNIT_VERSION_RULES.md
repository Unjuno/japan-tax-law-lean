# Normative units — 新旧法の適用（10,319 units, FULLY_VERIFIED）

Whole norm = temporal version selection → `FULLY_VERIFIED`. Concrete provisions
and dates are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| version_ref | 7,878 | 旧法…については、なお従前の例による — old law for specified matters |
| old_new_both | 2,417 | 新法…なお従前の例による — mixed new/old selection |
| amended_apply | 24 | 改正後の…は…適用しない／する — amended rule applicability |

| id | content |
|---|---|
| H | New law applies at/after enforcement, old law before it; "なお従前の例による" selects old law for specified matters; amended rules don't apply to pending procedures. |
| T | `lake build JapanTaxLaw.VersionedApplicationNormsTests`; `python scripts/ci/source_audit_version.py` |
| D | Kernel proofs of boundary behavior, exclusivity, exhaustiveness, old-law flagging and pending-exclusion; spec agreement; all 10,319 originals verbatim (4/4 checks). |
| C | Competing readings rejected: both laws at once, neither at the boundary, applying an amended rule to a pending procedure. |
| U | Concrete provisions/dates caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
