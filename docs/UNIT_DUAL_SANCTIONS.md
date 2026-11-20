# Normative units — 両罰規定と残余の委任（146 units）

| variant | count | structure |
|---|---|---|
| dual | 50 | 行為者を罰するほか、法人又は人に対し罰金刑を科する |
| deleg_penalty | 40 | 附則に定めるもののほか…経過措置（罰則を含む）は政令で定める |
| deleg_penalty2 | 32 | 同上（「に規定する」文言） |
| deleg_matter | 24 | 前項の規定の適用に関し必要な事項は政令で定める |

| id | content |
|---|---|
| H | Dual sanctions impose fines on both the actor and the corporation independently; the conjunction holds iff both fines are positive. The delegation variants record that content is supplied by cabinet order. |
| T | `lake build JapanTaxLaw.DualSanctionsAndDelegationTests`; `python scripts/ci/source_audit_dual.py` |
| D | Kernel proofs of conjunction projection/construction, independence of each fine from the other, and delegation-variant identity; spec agreement; all 146 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a single fine satisfying both roles, or treating the delegated content as if stated in the statute. |
| U | Actual fine amounts, offences and delegated content NOT MODELLED. Human legal review pending. |
