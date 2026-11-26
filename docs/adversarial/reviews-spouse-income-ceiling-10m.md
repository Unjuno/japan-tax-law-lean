# Adversarial review — IncomeTaxSpouseIncomeCeiling10M (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### IncomeTaxSpouseIncomeCeiling10M.lean — 所得税法 art.2(1) 同一生計配偶者

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 340AC0000000033, revision
  `340AC0000000033_20261001_507AC0000000070`,
  `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`.
  SHA-256 recomputed: `94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b`.
- Pinned needle located in scoped Article 2 Paragraph 1 Item 33-2 Column 2:
  「同一生計配偶者のうち、合計所得金額が千万円以下である居住者の配偶者をいう。」
  It occurs once in the pinned law.
- Statutory literal: 千万=10,000,000 in THIS clause; `spec_literals={10000000}`,
  clause correspondence True.
- Computation: impl `totalIncome <= 10,000,000` (inclusive 以下); independent
  spec `!(specCeilingYen < income)` with its own constant, no implementation
  identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (9,999,999), threshold_at (10,000,000),
  threshold_above (10,000,001). Finite grid check, not a universal theorem.
- 監査 (H/T/D/C/U): H（同一生計配偶者は合計所得千万円以下）,
  T（千万=10000000、境界9999999/10000000/10000001、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.2、数値当該条項に存在、spec independence）,
  U（居住者・同一生計の認定、控除適用・税額計算は NOT MODELLED、人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
