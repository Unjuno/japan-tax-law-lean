# STAGING: TouristTaxFineRange

- Normative id: NORM|aab84fc32ce58c8a9c2f3b4ea9e1cb70a7ea86a00cefd2b0b7a1f8e1fcbcfae2
- Law: 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, art. 24(2)
- Clause: 前項の納付しなかった国際観光旅客税の額が二百万円を超えるときは、情状により、同項の罰金は、二百万円を超えその納付しなかった国際観光旅客税の額に相当する金額以下とすることができる。
- Model: bounded integer interval (2,000,000, unpaid tax].
- Implementation: `JapanTaxLaw/TouristTaxFineRange.lean`.
- Independent spec: `JapanTaxLaw/TouristTaxFineRangeSpec.lean`.
- Tests: `JapanTaxLaw/TouristTaxFineRangeTests.lean` (eight kernel-decided examples).
- Review: `docs/adversarial/reviews-tourist-tax-fine-range.md`.
- NOT MODELLED: 情状認定、犯罪成立、未納税額の算定、併科・手続。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
