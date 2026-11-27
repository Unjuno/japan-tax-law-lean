# Adversarial review — LocalTaxInsuranceBusinessBase24Percent (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### LocalTaxInsuranceBusinessBase24Percent.lean — 地方税法 art.72の24の2(1)

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 325AC0000000226, revision
  `325AC0000000226_20261101_508AC0000000002`,
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.
  SHA-256 recomputed: `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.
- Pinned needle located in scoped Article 72_24_2 Paragraph 2 Item 1:
  「…収入保険料…に百分の二十四を乗じて得た金額」.
- Statutory rate: 百分の二十四 = 24/100 = 6/25. `spec_literals={24,100}` and the
  exact rational ratio is verified against THIS clause — a bare digit match
  elsewhere in the law is not accepted.
- Computation: impl `premium * 24 / 100`; independent spec decomposes as
  `premium / 100 * 24 + (premium % 100) * 24 / 100` with its own numerator and
  denominator constants, no implementation identifiers.
- Boundary categories (kernel-decided): zero (0), small_input (1),
  saturation (0), threshold_below (23/99), threshold_at (24/100),
  threshold_above (25/101). Finite grid, not a universal theorem.
- Rounding: Nat division (truncation) is assumed because this clause states no
  rounding rule; that assumption is NOT legally confirmed.
- 監査 (H/T/D/C/U): H（収入保険料に24%乗じた額）,
  T（24/100=6/25、境界23/24/25・99/100/101、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped art.72の24の2、rate ratio exact、spec independence）,
  U（保険種別の認定・再保険料控除・他号・端数処理の法的確定は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
