# Normative units — 332AC0000000026（資料未提出の推定）

16 PRESUMPTION units from the pinned revision `332AC0000000026_20261101_507AC0000000013`,
in four parallel article groups:

| group | count | 原文（要旨） |
|---|---|---|
| art.40の4 | 4 | 書類その他の資料の提示又は提出がないときは…に該当しないものと推定する（外国関係会社／事業年度） |
| art.40の7 | 4 | 同上（外国関係法人／事業年度） |
| art.66の6 | 4 | 同上（外国関係会社／事業年度） |
| art.66の9の2 | 4 | 同上（外国関係法人／事業年度） |

| id | content |
|---|---|
| H | If required documents are not submitted, the entity is presumed NOT to fall under the specified rule; if submitted, the caller's status determination applies. All four article groups implement the same branch structure. |
| T | `lake build JapanTaxLaw.DocumentationPresumptionsTests`; `python scripts/ci/source_audit_presumptions.py` |
| D | Kernel theorems for absent/present branches, exhaustive/exclusive conditions, monotonicity in status and four-group identity; spec agreement; all 16 originals verbatim (4/4 checks, 16/16 hits). |
| C | Competing reading rejected: treating the presumption as applying when documents ARE submitted (reverses the 「ないとき」 condition). The underlying criteria of 同号イ(1)-(5) etc. are not in these fragments. |
| U | Documents, status determinations, the enumerated subcategories and legal effects are caller-supplied / NOT MODELLED. Human legal review pending. |

This verifies the *conditional-presumption structure*, not the substantive conditions.
