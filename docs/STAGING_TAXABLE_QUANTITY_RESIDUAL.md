# STAGING: TaxableQuantityResidual

- Normative id: NORM|3f049c7ac5a29e667cddf5a3310f6887f45eeae97b97e43ecf1ab0b0517c5adb
- Law: 328AC0000000006, revision 328AC0000000006_20260525_506AC0000000052, art. 30_2(1)(3)
- Clause: 第一号に規定する課税標準たる数量からそれぞれ当該税率の適用区分ごとに前号に規定する課税標準たる数量を控除した数量（以下この項において「課税標準数量」という。）
- Model: bounded saturating subtraction of two provider quantities.
- Implementation: `JapanTaxLaw/TaxableQuantityResidual.lean`.
- Independent spec: `JapanTaxLaw/TaxableQuantityResidualSpec.lean`.
- Tests: `JapanTaxLaw/TaxableQuantityResidualTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-taxable-quantity-residual.md`.
- NOT MODELLED: 各号の数量算定、適用区分認定、端数処理。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
