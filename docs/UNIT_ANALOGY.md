# Normative units — 準用・適用参照・読替（4,639 units, FULLY_VERIFIED）

Whole norm = relational operator → `FULLY_VERIFIED`. Concrete provisions/tokens
are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| analogy | 3,157 | 「…の規定は…について準用する」 — apply rule of A to B |
| replacement | 761 | 「…中「A」とあるのは「B」とする」 — token substitution |
| apply_ref | 721 | 「…の規定を適用する」 — rule application |

| id | content |
|---|---|
| H | Analogy applies one rule's provisions to another subject; replacement substitutes a token; reference-application applies a rule when its condition holds. |
| T | `lake build JapanTaxLaw.AnalogyAndReplacementNormsTests`; `python scripts/ci/source_audit_analogy.py` |
| D | Kernel proofs of analogy/reference identity, substitution matched/unaffected, application truth-table and reference composition; spec agreement; all 4,639 originals verbatim (4/4 checks). |
| C | Competing readings rejected: resolved analogy to a wrong target, substituting the wrong token, applying a rule when its condition is unmet. |
| U | Concrete provisions/tokens caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
