# STAGING: SpouseIncomeCeiling950k

- Normative id: NORM|a83c043a9a854501ffc07d437ab7af860fa3490cdfee81771913e2cfa6a3a407
- Law: 340AC0000000033, revision 340AC0000000033_20261001_507AC0000000070, art. 83_2(1)(1)
- Clause: 合計所得金額が九十五万円以下である配偶者
- Model: bounded integer threshold (円); 950000 円 ceiling, no other spouse conditions.
- Implementation: `JapanTaxLaw/SpouseIncomeCeiling950k.lean` (`<=`).
- Independent spec: `JapanTaxLaw/SpouseIncomeCeiling950kSpec.lean` (`not (<)`).
- Tests: `JapanTaxLaw/SpouseIncomeCeiling950kTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-spouse-income-950k.md`.
- NOT MODELLED: 配偶者控除額、居住者・生計一・年末調整の要件、他号他条。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
