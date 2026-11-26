# STAGING: TouristTaxPenaltyBounds

- Normative id: NORM|2d2913868325c56a8cefe1373ea380c83f23b4e4ae0b951415c0facb5b02c43e
- Law: 430AC0000000016, revision 430AC0000000016_20260701_508AC0000000012, art. 25(1)
- Clause: 次の各号のいずれかに該当する者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。
- Model: disjunctive statutory bounds (prison <= 1 year or fine <= 500000 yen).
- Implementation: `JapanTaxLaw/TouristTaxPenaltyBounds.lean`.
- Independent spec: `JapanTaxLaw/TouristTaxPenaltyBoundsSpec.lean`.
- Tests: `JapanTaxLaw/TouristTaxPenaltyBoundsTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-tourist-tax-penalty-bounds.md`.
- NOT MODELLED: conduct recognition, sentencing choice, accumulation, procedure.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
