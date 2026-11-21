# Independent adversarial review — 相続税法 第二十一条の七（贈与税の税率, 上欄 2M–3M bracket）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: NO CONCRETE FINDINGS. Two non-blocking observations (O1 fixed proactively, O2 acknowledged).

| Check | H (refutable hypothesis) | T (reproduction) | D (decision) |
|---|---|---|---|
| T1 hash | sha256 fabricated | independent `hashlib.sha256(raw.read_bytes())` | **PASS** — `c01bb9be…043a7`, 856,326 B; matches INVENTORY |
| T2 needle | not verbatim / not unique / wrong cell | byte compare queue vs Lean quote (`:22`) vs audit `\u` literal (`:1311`) vs raw; structural walk | **PASS** — 二百万円を超え三百万円以下の金額 identical; whole-law count 1; `LawBody[3]/MainProvision[1]/…/Article(Num=21_7)/Paragraph(1)/TableStruct/Table/TableRow/TableColumn[0]/Sentence(1)`; ArticleCaption （贈与税の税率）, ArticleTitle 第二十一条の七; no CJK confusions |
| T3 identity | false Act / fabricated revision | INVENTORY + raw `revision_info` + revisions.json | **PASS** — Act, 相続税法, 昭和二十五年法律第七十三号, revision `…_20260401_506AC0000000008` current/enforced, in revisions.json |
| T4 locator | article-kind locator false | imported `transcription_audit.py`, called `find_article_text(...,"第二十一条の七")` | **PASS** — len 253, needle present; full audit 223/223 |
| T5 Lean | spec circular / unsound / banned tokens | read 3 files + `TaxFinance.lean` (`Money := Nat:29`); token scan | **PASS** — `specInBracket` successor half-open form; `agree_in_bracket` universal, proved with core Nat lemmas only → axiom-free; no sorry/admit/axiom/Classical.choice in code; `(2M,3M]` boundaries kernel-decided via `by unfold inBracket; decide` |
| T6 interpretations | を超え/以下, gift-vs-inheritance table, kind, labels, interval, 15% cell | structural table walk (8 rows × 2 columns; row 1 = needle + 百分の十五) | **PASS** all six — lower exclusive/upper inclusive; caption is 贈与税 (not 相続税 art.16); kind CONDITION; interval (2M,3M] faithful; paired 15% in separate TableColumn[1] 下欄, correctly out of scope |

## Non-blocking observations

- **O1 (U/C) — paraphrase label, comments/docs only.** `InheritanceGiftTaxRateBracket2M3M.lean:17` and `docs/UNIT_INHERITANCE_GIFT_TAX_BRACKET_2M_3M.md:1,16` used "課税価格の区分（上欄）", a descriptive gloss — the string occurs 0 times in the pinned law (which says "上欄に掲げる金額"). It appeared only in comments/docs, never in the formal model or audit needle, so it did not affect correctness. **Proactively fixed** (given the prior F1 statutory-label lesson): reworded to "上欄に掲げる金額" and explicitly marked as a descriptive gloss; impl hash refreshed `8547ca68…` → `a98ecece…`; gates re-run green.
- **O2 (C) — partial independence of spec lower bound.** The spec's lower conjunct `Nat.succ lower ≤ amount` is definitionally `lower < amount` in Lean (Nat.lt := succ ≤), so independence is partial; the upper conjunct is genuinely different. Not a defect — the equivalence proof still catches an upper-bracket `≤`/`<` error. Acknowledged, no change.

## Closing

No concrete findings requiring fixes; O1 fixed proactively, O2 acknowledged. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
