# STAGING: LocalRoadTaxPenaltyBounds

- Normative id: NORM|59252c611830c7174f1e31b83aa97cdd93dbf05739d25bfc56d6cd9d72618588
- Law: 330AC0000000104, revision 330AC0000000104_20260401_508AC0000000012, art. 15(1)
- Clause: 次の各号のいずれかに該当する者は、十年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。
- Model: disjunctive statutory bounds (prison <= 10 years or fine <= 1000000 yen).
- Implementation: `JapanTaxLaw/LocalRoadTaxPenaltyBounds.lean`.
- Independent spec: `JapanTaxLaw/LocalRoadTaxPenaltyBoundsSpec.lean`.
- Tests: `JapanTaxLaw/LocalRoadTaxPenaltyBoundsTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-local-road-tax-penalty-bounds.md`.
- NOT MODELLED: conduct recognition, sentencing choice, accumulation, procedure.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
