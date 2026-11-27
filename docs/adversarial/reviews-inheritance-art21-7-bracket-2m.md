# Adversarial review — InheritanceTaxArt21_7Bracket2M (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### InheritanceTaxArt21_7Bracket2M.lean — 相続税法 art.21の7 表セル

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000073, revision
  `325AC0000000073_20260401_506AC0000000008`,
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`.
  SHA-256 recomputed: `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.
- Pinned needle 「二百万円以下の金額」 located in the exact table cell
  (`.../Article:21_7/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`);
  it occurs once in the pinned law. The pin carries the exact `normative_id`.
- Statutory literal: 二百万=2,000,000 (inclusive upper) in THIS clause;
  `spec_literals={2000000}`, clause correspondence True.
- Computation: impl `amount <= 2,000,000`; independent spec `!(specMax < amount)`
  with its own constant, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (1,999,999), threshold_at (2,000,000),
  threshold_above (2,000,001). Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（二百万円以下の金額の帯域判定）,
  T（2000000、境界1999999/2000000/2000001、SHA-256固定、セル単位特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped table cell、数値当該セルに存在、spec independence）,
  U（他帯域・贈与税額計算・控除・申告は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — one table cell only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
