# STAGING: AviationFuelTaxFineRange

- Normative id: NORM|791b0b89be1a66fddc2c631133e65ebd1ac1c49cc8e10a8ddf6dc62da698ca33
- Law: 431AC0000000003, revision 431AC0000000003_20260401_508AC0000000002, art. 23(3)
- Clause: 前項の納入しなかった金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかった金額に相当する額以下の額とすることができる。
- Model: bounded integer interval (2,000,000, unpaid amount].
- Implementation: `JapanTaxLaw/AviationFuelTaxFineRange.lean`.
- Independent spec: `JapanTaxLaw/AviationFuelTaxFineRangeSpec.lean`.
- Tests: `JapanTaxLaw/AviationFuelTaxFineRangeTests.lean` (eight kernel-decided examples).
- Review: `docs/adversarial/reviews-aviation-fuel-tax-fine-range.md`.
- NOT MODELLED: 情状認定、犯罪成立、納入額算定、併科・手続。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
