# Adversarial review — CustomsTariffArt8ExtensionSixMonths (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### CustomsTariffArt8ExtensionSixMonths.lean — 関税定率法 art.8(6)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 143AC0000000054, revision
  `143AC0000000054_20260601_508AC0000000005`,
  `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`.
  SHA-256 recomputed: `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.
- Pinned needle located in scoped Article Num 8, Paragraph 6 Sentence 2
  (`.../Article:8/Article#8/Paragraph#6/ParagraphSentence/Sentence#2`).
  The same clause text appears in other paragraphs; the exact unit source path
  distinguishes this paragraph.
- Statutory literal: 六=6 (months) in THIS clause; `spec_literals={6}`,
  clause correspondence True.
- Computation: impl `extensionMonths <= 6`; independent spec
  `!(specMaxMonths < months)` with its own constant, no implementation
  identifiers. Upper bound is inclusive (六月以内).
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (5), threshold_at (6), threshold_above (7). Finite grid
  check, not a universal theorem.
- 監査 (H/T/D/C/U): H（特別の理由がある場合、期間を六月以内に限り延長可）,
  T（六=6、境界5/6/7、SHA-256固定、paragraph-scoped needle）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.8(6)、数値当該条項に存在、spec independence）,
  U（「特別の理由」の認定・他項の延長期間・手続・法的効果は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
