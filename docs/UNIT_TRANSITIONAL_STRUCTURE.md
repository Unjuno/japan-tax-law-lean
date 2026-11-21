# Normative units — 経過適用・読替適用の構造（5,952 units, PROVED_SCOPE）

These are substantive clauses but 原文 verification establishes only their shared
temporal/application structure; the concrete provisions, dates and taxpayers are
NOT MODELLED and each unit retains its unhandled conditions → `PROVED_SCOPE`,
never `FULLY_VERIFIED`. Per-unit legal formalization and human review remain.

| family | units | structure |
|---|---|---|
| reading_application | 2,683 | 「…中「A」とあるのは「B」として読み替えて適用」 — token substitution |
| suppl_application | 1,779 | 「改正後の…法（以下「新法」という。）…の適用については…」 — new/old law selection |
| interim_period | 1,041 | 「Xから施行日の前日までの間…」 — bounded interim period |
| except_transitional | 449 | 「別段の定めがあるものを除き…なお従前の例による」 — exception + old law |

| id | content |
|---|---|
| H | These clauses substitute tokens, select new vs old law at the enforcement boundary, bound an interim period, or apply old law absent an exception. |
| T | `lake build JapanTaxLaw.TransitionalApplicationStructureTests`; `python scripts/ci/source_audit_transstruct.py` |
| D | Kernel proofs of token substitution, new/old-law exclusivity, interim-period bounds and exception logic; independent spec; all 5,952 originals verbatim (4/4 checks). |
| C | Competing readings rejected: both laws applying at once, use outside the interim period, and ignoring a stated exception. |
| U | Concrete provisions, dates and taxpayers NOT MODELLED; substantive legal content awaits per-unit formalization and human review. Status remains `PROVED_SCOPE`. |
