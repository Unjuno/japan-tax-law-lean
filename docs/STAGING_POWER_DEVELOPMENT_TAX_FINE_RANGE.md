# STAGING: PowerDevelopmentTaxFineRange

- Normative id: NORM|34a573f53421262fb9326c5c32576f2fca6484ced306c8bed76190fd5c4f2cc5
- Law: 349AC0000000079, revision 349AC0000000079_20250601_504AC0000000068, art. 12(4)
- Clause: 前項の犯罪に係る販売電気に対する電源開発促進税に相当する金額が五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え当該電源開発促進税に相当する金額以下とすることができる。
- Model: bounded integer interval (500,000, tax amount].
- Implementation: `JapanTaxLaw/PowerDevelopmentTaxFineRange.lean`.
- Independent spec: `JapanTaxLaw/PowerDevelopmentTaxFineRangeSpec.lean`.
- Tests: `JapanTaxLaw/PowerDevelopmentTaxFineRangeTests.lean` (eight kernel-decided examples).
- Review: `docs/adversarial/reviews-power-development-tax-fine-range.md`.
- NOT MODELLED: 情状認定、犯罪成立、税額算定、併科・手続。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
