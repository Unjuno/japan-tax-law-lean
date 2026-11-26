# STAGING: GasolineTransferPayable

- Normative id: NORM|18ee592ed4fc85004c77200445b576ef0168e9660f0b08e6a4fad65396653d56
- Law: 332AC0000000055, revision 332AC0000000055_20260525_506AC0000000052, art. 10
- Clause: 第六号に掲げる揮発油税額から前号に掲げる揮発油税額を控除した金額に相当する揮発油税額（以下「移出に係る納付すべき税額」という。）
- Model: bounded saturating difference of sixth-item and previous-item gasoline taxes.
- Implementation: `JapanTaxLaw/GasolineTransferPayable.lean`.
- Independent spec: `JapanTaxLaw/GasolineTransferPayableSpec.lean`.
- Tests: `JapanTaxLaw/GasolineTransferPayableTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-gasoline-transfer-payable.md`.
- NOT MODELLED: item tax computation, transfer recognition, filing/payment procedure.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
