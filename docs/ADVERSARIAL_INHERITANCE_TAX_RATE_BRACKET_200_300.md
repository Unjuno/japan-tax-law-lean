# Independent adversarial review — 相続税法 第十六条の表(1)（二億円超三億円以下）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified; no
`lake build` run by reviewer.

## Verdict: NO FINDINGS — every falsifiable claim independently reproduced and passes.

| # | H (falsifiable hypothesis) | T (independent test) | D |
|---|---|---|---|
| 1 | hash/snapshot fabricated | `hashlib.sha256` = `c01bb9be…043a7`, 856,326 B; matches INVENTORY; revision exists on disk + raw | PASS |
| 2 | false law identity/revision | raw `law_info` = Act / 325AC0000000073 / 昭和二十五年法律第七十三号; `law_title`=相続税法; all = INVENTORY | PASS |
| 3 | needle location/count wrong | whole-law count 1; Article Num=16, ArticleTitle 第十六条, text len 437; path Law→LawBody→MainProvision→Ch2→Sec1→Article16→Paragraph1→TableStruct→Table→TableRow→TableColumn→Sentence1; row confirms `二億円を超え三億円以下の金額 百分の四十五` flanked by 1–2億 and 3–6億 rows | PASS |
| 4 | article-kind-locator claim false | `find_article_text("325AC0000000073","第十六条")` returns non-None len 437 containing needle | PASS |
| 5 | false 別表第一 label | whole-law 別表第一 count 3, all cross-refs to OTHER statutes (入管法/新地方自治法/地方自治法); no self-ref; `Appdx*`=0; `TableStruct`=4; unit files + audit check use `第十六条の表(1)`, never 別表第一 | PASS |
| 6 | byte-level CJK defect | audit needle `\u4e8c…\u984d` decodes to queue text; Lean 原文 quote equal; codepoints all correct (二 U+4E8C, 億 U+5104, etc.); 二億=200M, 三億=300M | PASS |
| 7 | spec circular / unsound | `specInBracket = Nat.succ 200M ≤ x ∧ x ≤ 300M` distinct from impl `<`; `agree_bracket` ∀x via `Nat.succ_le_of_lt`/`Nat.lt_of_succ_le`; boundaries `decide` on closed Nat goals; `bounds_decoded` rfl; no sorry/admit/axiom/Classical.choice/unsafe/noncomputable | PASS |

## Competing interpretations / uncertainty (no findings)

- C1 (scope): model captures only the interval predicate; rate (45%), base computation,
  deductions, other brackets/table/paragraphs declared out of scope in queue + Lean
  doc comments — honest, not over-claiming.
- C2 (kind): `CONDITION` appropriate for bracket-membership predicate.
- U1: queue source-path notation (`MainProvision/MainProvision[1]/…`) differs from
  tree `Chapter/Section` levels, but authoritative anchors (Article 16, 第十六条,
  TableStruct cell) all match — no practical consequence.

## Closing

NO FINDINGS. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
