# Adversarial review — InheritanceTaxArt16BracketOver600M (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### InheritanceTaxArt16BracketOver600M.lean — 相続税法 art.16 表セル

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000073, revision
  `325AC0000000073_20260401_506AC0000000008`,
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`.
  SHA-256 recomputed: `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.
- Pinned needle 「六億円を超える金額」 located in the exact table cell
  (`.../Article:16/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`);
  occurs once in the pinned law. Pin carries the exact `normative_id`.
- Statutory literal: 六億=600,000,000 (exclusive lower) in THIS clause;
  `spec_literals={600000000}`, clause correspondence True.
- Computation: impl `amount > 600,000,000`; independent spec `!(amount <= specLower)`
  with its own constant, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (599,999,999), threshold_at (600,000,000),
  threshold_above (600,000,001). Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（六億円を超える金額の帯域判定）,
  T（600000000、境界599999999/600000000/600000001、SHA-256固定、セル単位特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped table cell、数値当該セルに存在、spec independence）,
  U（他帯域・課税価格算定・税率・控除は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — one table cell only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
