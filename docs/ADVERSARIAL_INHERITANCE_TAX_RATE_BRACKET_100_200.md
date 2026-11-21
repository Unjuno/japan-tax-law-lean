# Independent adversarial review — 相続税法 第十六条(1)（一億円超二億円以下）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified; no
`lake build` run by reviewer.

## Verdict: ONE CONCRETE FINDING (F1) — reproduced and FIXED. All other checks PASS.

| # | H (hypothesis to falsify) | T (independent test) | D |
|---|---|---|---|
| 1 | sha256 wrong | `hashlib.sha256` = `c01bb9be…043a7`, matches INVENTORY/queue | PASS |
| 2 | byte-level CJK defect | queue text `一億円を超え二億円以下の金額` from `build/task_queue.json`; Lean quote, audit needle (decoded from `\u` escapes), raw sentence all codepoint-identical; 一億円=100M, 二億円=200M | PASS |
| 3 | fabricated revision | INVENTORY `current_revision` = `325AC0000000073_20260401_506AC0000000008`; raw revision_info identical; CurrentEnforced | PASS |
| 3b | false law identity/law-number | raw + INVENTORY `law_type=Act`, title 相続税法, law_num 昭和二十五年法律第七十三号; impl header byte-exact | PASS |
| 4 | article-kind-locator claim false | `find_article_text("325AC0000000073","第十六条")` returns article len 437 containing needle | PASS |
| 5 | spec circular / unsound | successor-based `Nat.succ lowerBoundYen ≤ x` distinct from `<`; `agree_bracket` universal ∀x via core Nat lemmas; no sorry/admit/axiom; `Money=Nat`; boundaries correct on closed unfolded goals | PASS |
| 6 | strictness/scope wrong | 超え strict >, 以下 ≤; `lower_exclusive` 100M fails, `first_qualifying` 100,000,001, `upper_inclusive` 200M, `above_upper` 200,000,001; rate/other brackets/base/deductions/table-rest explicitly out of scope | PASS |

## F1 — false 「別表第一」 statutory label (FIXED)

- **H:** impl/spec/tests/audit asserted the rate table is 「別表第一」, but the pinned
  相続税法 has no self-referential 別表第一; the table is an Article 16 `TableStruct`
  (「次の表」).
- **T:** raw `count("別表第一")=3`, all cross-references to OTHER statutes
  (出入国管理及び難民認定法 / 新地方自治法 / 地方自治法); `count("速算")=0`; no `Appdx*`
  tags; only `TableStruct` in Article 16. Author reproduced via census.
- **D: FAIL** on label fidelity. **Fix applied:** targeted replacement
  「第十六条 別表第一」→「第十六条の表」 and 「第十六条(1) 別表第一」→「第十六条(1)の表」
  in both the current unit and the already-merged sibling (`InheritanceTaxRateBracket30_50`,
  PR #313, whose reviewer reported NO FINDINGS but carried the same defect), plus residual
  scope-note occurrences. The audit script's 68 legitimate 別表第一 occurrences for other
  laws were left untouched (only the 4 for these two units changed). Rebuilt `GATES_OK`;
  6 hashes refreshed.
- **C:** the mislabel likely inherited from upstream task framing; no competing valid
  interpretation — the pinned source is definitive.
- **U:** label-only; the bracket predicate, proofs and audit needle are correct.

## Minor note (non-finding)

A leftover comment naming the sibling unit sits above this unit's check in the audit
script — documentation-only, does not affect the check (correct needle/law/article).

## Closing

F1 reproduced and fixed; all substantive checks PASS. No claim of legal correctness;
human legal review remains `LEGAL_REVIEW_PENDING`.
