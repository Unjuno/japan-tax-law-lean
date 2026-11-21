# Independent adversarial review — 相続税法 第十六条の表(1)（三億円超六億円以下）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified; no
`lake build` run by reviewer.

## Verdict: NO CONCRETE FINDINGS — every load-bearing claim independently reproduced.

| # | H (hypothesis) | T (reproduction) | D | C | U |
|---|---|---|---|---|---|
| 1 | snapshot hash = claimed | Python `hashlib.sha256` raw bytes | PASS — `c01bb9be…043a7`, 856,326 B; matches INVENTORY | uppercase INVENTORY sha matches | none |
| 2 | needle verbatim & unique | flatten `law_full_text`, count, codepoint dump | PASS — count 1; codepoints `[4e09,5104,5186,3092,8d85,3048,516d,5104,5186,4ee5,4e0b,306e,91d1,984d]` identical in raw, Lean quote, audit needle | none | none |
| 3 | article/table location wrong | tree-walk to containing node | PASS — Article Num=16, ArticleTitle 第十六条, Paragraph#1, TableStruct cell, text `三億円を超え六億円以下の金額百分の五十` | queue path uses different indexing layer — notation only | minor path-notation diff, not an error |
| 4 | false 別表第一 label | count 別表第一, scan Appdx tags | PASS — raw 3× 別表第一 all cross-refs (入管法/新地方自治法/地方自治法); 0 Appdx tags; unit + audit use only 第十六条 | none | none |
| 5 | fabricated revision | INVENTORY + raw revision_info | PASS — `325AC0000000073_20260401_506AC0000000008` identical; file on disk; enforcement 2026-04-01 CurrentEnforced | none | none |
| 6 | false law identity | law_info/revision_info/INVENTORY | PASS — law_id=325AC0000000073, law_type=Act, title 相続税法, num 昭和二十五年法律第七十三号 | none | none |
| 7 | article-kind locator claim false | call find_article_text(...,"第十六条") | PASS — non-None, len 437, needle present | none | none |
| 8 | Lean proofs unsound | read all three files | PASS — no sorry/admit/axiom/Classical.choice; Money=Nat; agree_bracket universal; core Nat lemmas; boundaries closed decide/rfl | none | none |

## Interpretive detail (all PASS)

- (a) Boundaries: 超え strict >, 以下 ≤; impl `300M < x ∧ x ≤ 600M` exact; successor-based spec distinct; `agree_bracket` ∀x; boundaries correct.
- (b) Scope: one upper-column bracket cell of Article 16's rate table; only interval predicate modeled; rate (百分の五十), other brackets, base computation, deductions, table rest, other paragraphs out of scope — honest.
- (c) `kind=CONDITION` appropriate. (d) labels correct (Act, 第十六条の表, no self-referential 別表第一). (e) proof mechanics sound.

## Non-findings (minor)

- queue source-path string uses a different indexing convention than raw tree; article/paragraph/Sentence#1 all confirmed correct.
- `"第十六条の表(1)"` is a descriptive cell label consistent with sibling units, not a claim a statutory 別表第一 exists.

## Closing

NO FINDINGS. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
