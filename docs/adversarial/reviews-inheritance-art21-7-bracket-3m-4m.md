# Adversarial review — InheritanceTaxArt21_7Bracket3M4M (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### InheritanceTaxArt21_7Bracket3M4M.lean — 相続税法 art.21の7 表セル

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000073, revision
  `325AC0000000073_20260401_506AC0000000008`,
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`.
  SHA-256 recomputed: `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.
- Pinned needle re-extracted verbatim from the table cell
  (`.../Article:21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`):
  「三百万円を超え四百万円以下の金額」. It occurs once in the pinned law,
  so a same-number match elsewhere cannot substitute for this cell.
- Statutory literals: 三百万=3,000,000 (exclusive lower), 四百万=4,000,000
  (inclusive upper). `spec_literals={3000000,4000000}`; both spellings found
  in THIS clause; clause correspondence True.
- Computation: impl `amount > 3000000 && amount <= 4000000`; independent spec
  uses `!(4000000 < amount) && !(amount <= 3000000)` with its own constants,
  no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (2,999,999 / 3,999,999), threshold_at (3,000,000 / 4,000,000),
  threshold_above (3,000,001 / 4,000,001). Note the lower bound is exclusive
  and the upper inclusive. Finite grid check, not a universal theorem.
- 監査 (H/T/D/C/U): H（三百万円超四百万円以下の金額の帯域判定）,
  T（三百万=3000000、四百万=4000000、境界2999999/3000000/3000001・
  3999999/4000000/4000001、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped table cell、数値当該セルに存在、spec independence）,
  U（他帯域・税率・控除額・適用主体は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — one table cell only, NOT the article.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
