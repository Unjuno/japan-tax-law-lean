# Adversarial review — InheritanceTaxArt16Bracket50M100M (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### InheritanceTaxArt16Bracket50M100M.lean — 相続税法 art.16 表セル

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000073, revision
  `325AC0000000073_20260401_506AC0000000008`,
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`.
  SHA-256 recomputed: `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.
- Pinned needle re-extracted from the table cell
  (`.../Article:16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`):
  「五千万円を超え一億円以下の金額」 — occurs once in the pinned law.
- Statutory literals: 五千万=50,000,000 (exclusive lower), 一億=100,000,000
  (inclusive upper); `spec_literals={50000000,100000000}`, both spellings found
  in THIS clause; clause correspondence True.
- Computation: impl `50M < amount && amount <= 100M`; independent spec uses
  negated comparisons `!(100M < amount) && !(amount <= 50M)` with its own
  constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (49,999,999 / 99,999,999), threshold_at (50,000,000 /
  100,000,000), threshold_above (50,000,001 / 100,000,001). Finite grid,
  not a universal theorem.
- 監査 (H/T/D/C/U): H（五千万円超一億円以下の金額の帯域判定）,
  T（50000000/100000000、境界の前後、SHA-256固定、セル単位特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped table cell、数値当該セルに存在、spec independence）,
  U（他帯域・課税価格算定・税率・控除は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — one table cell only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
