# Adversarial review — GiftTaxTenYearResidenceLookback (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### GiftTaxTenYearResidenceLookback.lean — 相続税法 art.1の4

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000073, revision
  `325AC0000000073_20260401_506AC0000000008`,
  `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`.
  SHA-256 recomputed: `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.
- Pinned needle located in scoped Article 1_4, Paragraph 1, Item 2, Subitem
  sentence. The full clause appears twice in the law; the exact structural path
  identifies this provision ( Directive §4 clause-level scoping).
- Statutory literal: 十=10 (years) in THIS clause; `spec_literals={10}`,
  clause correspondence True.
- Computation: impl `yearsBeforeGift <= 10` (inclusive upper bound); independent
  spec `!(specLookback < years)` with its own constant, no implementation
  identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  threshold_below (9), threshold_at (10), threshold_above (11). Finite grid
  check, not a universal theorem.
- 監査 (H/T/D/C/U): H（贈与前十年以内に施行地に住所を有していたことがある場合）,
  T（十=10、境界9/10/11、SHA-256固定、条項パス特定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.1の4、数値当該条項に存在、spec independence）,
  U（住所の事実認定・財産評価・税率・申告・他の号の選択肢は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
