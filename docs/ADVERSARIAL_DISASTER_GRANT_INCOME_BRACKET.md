# Independent adversarial review — 災害被害者租税減免等施行令 附則第三条(5)第一号（六百万円超七百五十万円以下）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: independent Python `hashlib`/`json`/codepoint scripts written
to temp files outside the repo and deleted afterward. `lake build` not run. No
repository file modified.

## Verdict: NO FINDINGS. All six audit axes PASS.

| # | H (falsifiable hypothesis) | T (reproduction) | D | C | U |
|---|---|---|---|---|---|
| 1 | Raw snapshot hash fabricated | `hashlib.sha256(raw_bytes)` | PASS — `f6fe1c93…a66a21c`, 191,809 B, matches INVENTORY | none | none |
| 2a | Needle mis-transcribed / wrong count | count in `json.dumps(data,ensure_ascii=False)` + normalized | PASS — count 1 verbatim, 1 normalized | none | none |
| 2b | Wrong article label | structural walk to containing node | PASS — `Article Num=3`, `ArticleTitle=第三条`, `Paragraph 5`, `Item 1`, inside `SupplProvision` (附則) | none | none |
| 2c | Lean 原文 quote ≠ queue text | codepoint compare + sha of string | PASS — identical, 41 chars, sha `84f23502…fd77` | none | none |
| 2d | Audit needle literal ≠ queue text | codepoint compare | PASS — identical | none | none |
| 2e | Numeric kanji defect 七百五百万円 (百 U+767E) | codepoint dump of 七百五十万円 segment | PASS — char after 五 is 十 `U+5341`; wrong 百 absent; `upperBoundYen = 7_500_000` | none | none |
| 3a | Fabricated revision | INVENTORY `current_revision.law_revision_id` + raw `revision_info` + disk | PASS — all `322CO0000000268_20251201_507CO0000000120`; file on disk | none | none |
| 3b | Wrong law-title glyph 徴税 (U+7A0E) | codepoint dump of assembled doc-comment title vs raw law_title | PASS — `徴収` `U+53CE U+6536`; doc title byte-identical to raw; no `徴税` anywhere | none | none |
| 3c | Wrong law type / number | INVENTORY + raw | PASS — `CabinetOrder` (政令), `昭和二十二年政令第二百六十八号` | none | none |
| 4 | File-kind-locator claim false | replicate `find_article_text("322CO0000000268","第三条")` | PASS — returns a different 106-char main-provision article NOT containing the needle | none | none |
| 5a | Spec not independent / circular | read `specInBracket`, `agree_bracket` | PASS — successor form `Nat.succ lowerBoundYen ≤ x`, universal `(x : Money)`, core inverse lemmas | none | none |
| 5b | Unsound escape hatch | grep `sorry\|admit\|axiom\|Classical.choice` | PASS — none in code; `Money := Nat` | none | none |
| 6a | Wrong strictness/amount | boundary theorems | PASS — `¬inBracket 6_000_000`, `inBracket 6_000_001`, `inBracket 7_500_000`, `¬inBracket 7_500_001`, `bounds_decoded` rfl | none | none |
| 6b | Scope over-approximation | read Scope doc-comment | PASS — explicitly excludes substantive law, gated benefit, other items, 災害時, 省令 | declared abstraction, not over-approximation | none |
| 6c | Wrong `kind` | queue kind=CONDITION vs predicate | PASS — class-membership condition predicate is faithful CONDITION | none | none |

## Detailed evidence

- Hash: `f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c`, 191,809 B — matches pinned claim and INVENTORY.
- Needle: exactly one 41-char string equals queue text; at `Law[Num=268]/LawBody/SupplProvision/Article[Num=3]/Paragraph[Num=5]/Item[Num=1]`, `ArticleTitle=第三条` — matches `附則第三条(5)第一号`.
- Codepoints: numeric segment `七(U+4E03) 百(U+767E) 五(U+4E94) 十(U+5341) 万(U+4E07) 円(U+5186)` = 七百五十万円 = 7,500,000; `upperBoundYen := 7_500_000`. Title glyph `…減免、徴収(U+53CE U+6536)猶予等…`; assembled doc-comment title byte-identical to raw law_title. Prior-turn defects absent.
- Revision: INVENTORY and raw `revision_info` both `322CO0000000268_20251201_507CO0000000120`; CabinetOrder.
- Locator: `find_article_text(...,"第三条")` returns a different 106-char main article (第三条法第三条第一項…), no needle — file-kind locator correctly justified (transcription_audit.py:1294–1302).
- Lean: `DisasterGrantIncomeBracketSpec.lean:28–39` successor-based distinct formulation, universal `agree_bracket`; `Money := Nat` (TaxFinance.lean:29); boundary theorems lines 42–59 correct on strict-lower/inclusive-upper. No sorry/admit/axiom/Classical.choice.

## Residual uncertainty (not findings)
- Reviewer did not run `lake build` per instruction; static analysis only — no soundness concern.
- Scope: model captures income-interval predicate (a necessary condition for class membership), not full statutory class — explicitly declared, acceptable for CONDITION unit.

## Closing

NO FINDINGS. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
