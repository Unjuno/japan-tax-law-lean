# Adversarial review — LocalTaxArt23IncomeCeiling5M (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LocalTaxArt23IncomeCeiling5M.lean — 地方税法 art.23

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000226, revision
  `325AC0000000226_20261101_508AC0000000002`,
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
  SHA-256 recomputed: `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Pinned needle located in scoped Article 23 Paragraph 1 Item 11 Subitem 2, exact `normative_id`.
- Statutory literal: 五百万=5,000,000 (inclusive upper) in THIS clause;
  `spec_literals={5000000}`, clause correspondence True.
- Computation: impl `amount <= 5000000`; independent spec `!(5000000 < amount)`,
  no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1), saturation (0),
  threshold_below (4999999), threshold_at (5000000), threshold_above (5000001).
  Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（前年の合計所得金額は500万円以下）,
  T（5000000、境界4999999/5000000/5000001、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.23、数値当該条項に存在、spec independence）,
  U（合計所得金額の算定・前年認定・他号との併用は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
