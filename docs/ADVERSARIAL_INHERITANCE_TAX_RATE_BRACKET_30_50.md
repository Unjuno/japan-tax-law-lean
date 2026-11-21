# Independent adversarial review — 相続税法 第十六条 別表第一(1)（三千万円超五千万円以下）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: independent Python `hashlib`/`json`/codepoint scripts written
to temp files and deleted afterward. `lake build` not run. No repository file
modified.

## Verdict: NO FINDINGS. All six review areas PASS.

| # | Area | H (falsifiable hypothesis) | T (reproduction) | D | C/U |
|---|---|---|---|---|---|
| 1 | sha256 | hash fabricated | `hashlib.sha256` of raw bytes (856,326 B) | PASS — `c01bb9be…043a7` matches Lean header | none |
| 2 | needle/count/bytes | needle mis-transcribed | queue-authoritative needle; flattened count; structural walk; codepoint compare | PASS — count 1; chain `LawBody[3]/MainProvision/Article:16/Paragraph:1/TableStruct/Table/TableRow/TableColumn/Sentence:1`; Lean quote == queue; audit needle == queue; raw contains needle | none |
| 3 | identity/revision | wrong law identity / fabricated revision | INVENTORY + raw `revision_info` + disk | PASS — 相続税法, 昭和二十五年法律第七十三号, `Act` (法律, not CabinetOrder), revision `325AC0000000073_20260401_506AC0000000008` real | none |
| 4 | article locator | `find_article_text` claim false | direct call `find_article_text("325AC0000000073","第十六条")` | PASS — not None, len 437, needle present (art.16 総額 table, row 三千万円を超え五千万円以下の金額百分の二十五) | none |
| 5 | Lean soundness | spec circular / unsound tokens | read spec/proofs + grep `sorry/admit/axiom/Classical.choice` | PASS — successor-based distinct spec; universal `agree_bracket` via `Nat.succ_le_of_lt`/`Nat.lt_of_succ_le`; forbidden tokens only in a doc-comment sentence; boundary theorems closed `decide`/`rfl` sound | none |
| 6 | interpretation | wrong strictness / dishonest scope | boundary theorems + scope doc-comment | PASS — `超え` strict >, `以下` ≤; impl `30_000_000 < x ∧ x ≤ 50_000_000`; rate (25%), other brackets, base computation, deductions, rest of 別表第一, other paragraphs explicitly out of scope | U: no `lake build` per instruction; static reading only — no soundness concern |

## Detailed evidence

- Needle codepoints: 三 U+4E09, 千 U+5343, 万 U+4E07, 円 U+5186, を U+3092, 超 U+8D85, え U+3048, 五 U+4E94, 以下 U+4EE5 U+4E0B, の U+306E, 金 U+984D — no confusable substitutions. All three sources (Lean quote, audit needle, raw) byte-identical.
- Revision real and consistent across INVENTORY, raw `revision_info`, and Lean header; law type `Act` (法律) — correct.
- `find_article_text` returns the art.16 tax-total table (begins 「（相続税の総額）第十六条…」), len 437, containing the needle — article-kind locator claim true.
- `agree_bracket` (`Spec.lean:32-39`) proved for all x via core Nat equivalences; no forbidden constructs in proof terms; boundaries kernel-decided on closed unfolded goals.

## Closing

NO FINDINGS. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
