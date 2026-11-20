# Normative units — 経過措置の委任と施行前行為の罰則（694 units）

Two §3 structures across many revisions:

| group | count | 原文（要旨） |
|---|---|---|
| deleg_1 | 439 | この附則に規定するもののほか…必要な経過措置は、政令で定める |
| deleg_2 | 58 | …この法律の施行に伴い必要な経過措置は、政令で定める |
| deleg_3 | 49 | この附則に定めるもののほか…施行に伴い… |
| deleg_4 | 26 | この附則に定めるもののほか…施行に関し… |
| prior_penalty | 122 | 施行前にした行為に対する罰則の適用については、なお従前の例による |

| id | content |
|---|---|
| H | The four delegation variants express one structure: the statute delegates transitional measures to cabinet order (delegated content is caller-supplied). The prior-penalty rule is a temporal switch: acts before enforcement use the OLD penalty law, acts on/after enforcement use the NEW law. |
| T | `lake build JapanTaxLaw.TransitionalDelegationAndPriorPenaltyTests`; `python scripts/ci/source_audit_transitional.py` |
| D | Kernel proofs of delegation-variant identity, before/after branches, old/new exclusiveness and exhaustiveness, boundary lemma; spec agreement; all 694 originals verbatim (5/5 checks). |
| C | Competing readings rejected: treating delegated content as if stated in the statute; applying the new penalty law to pre-enforcement acts; treating 「に規定する」/「に定める」 as distinct structures. |
| U | Delegated content, penalty amounts, the actual enforcement date and all other law provisions NOT MODELLED. Human legal review pending. |
