# STAGING: OkinawaTaxableQuantityResidual

- Normative id: NORM|2e5447d9cb81e83c203d8a3262428398e6f52bc95dbdb36b5a8c291862ebef16
- Law: 347M50000040042, revision 347M50000040042_20251231_507M60000040072, art. 20(1)(1の3)
- Clause: 第一号の数量から前号の数量を控除した数量（以下この項において「課税標準数量」という。）
- Model: bounded saturating residual of two provider quantities.
- Implementation: `JapanTaxLaw/OkinawaTaxableQuantityResidual.lean`.
- Independent spec: `JapanTaxLaw/OkinawaTaxableQuantityResidualSpec.lean`.
- Tests: `JapanTaxLaw/OkinawaTaxableQuantityResidualTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-okinawa-taxable-quantity-residual.md`.
- NOT MODELLED: item quantity computation, goods recognition, filing procedure.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
