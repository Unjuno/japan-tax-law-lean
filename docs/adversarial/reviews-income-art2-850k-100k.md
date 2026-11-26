# Adversarial review — IncomeTaxArt2Income850kOther100k (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### IncomeTaxArt2Income850kOther100k.lean — 所得税法 art.2(1)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 340AC0000000033, revision
  `340AC0000000033_20261001_507AC0000000070`,
  `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`.
  SHA-256 recomputed: `94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b`.
- Pinned needle located in scoped Article 2 Paragraph 1 Item 32 Column 2:
  「…合計所得金額が八十五万円以下であり、かつ、…十万円以下であるものをいう。」
- Statutory literals: 八十五万=850,000 and 十万=100,000, both in THIS clause;
  `spec_literals={850000,100000}`, clause correspondence True.
- Computation: impl `total <= 850000 && other <= 100000` (both inclusive);
  independent spec uses negated comparisons with its own constants, no
  implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (849,999 / 99,999), threshold_at (850,000 / 100,000),
  threshold_above (850,001 / 100,001). Finite grid, not a universal theorem.
- 監査 (H/T/D/C/U): H（合計所得85万円以下かつ給与所得等以外10万円以下）,
  T（850000/100000、両境界の前後、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.2、数値当該条項に存在、spec independence）,
  U（勤労に基づく所得の事実認定・所得計算・控除・税額は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
