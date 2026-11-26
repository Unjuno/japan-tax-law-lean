# STAGING: GeneralTariffLowerRate

- Normative id: NORM|2716d0b794ffcbd5453a423cf8d85e04c8e471b2fa1ace304f72d74b1490004d
- Law: 414CO0000000262, revision 414CO0000000262_20110401_423CO0000000088, art. 4(1)
- Clause: 特定貨物に課する不当廉売関税及び一般税率（法の別表の税率及び条約に規定する税率のうちいずれか低いものをいう。）による関悦については、それぞれ別個の関税として関税法（昭和二十九年法律第六十一号）第二章の規定を適用する。
- Model: lower of two provider tariff rates on a common integer scale.
- Implementation: `JapanTaxLaw/GeneralTariffLowerRate.lean`.
- Independent spec: `JapanTaxLaw/GeneralTariffLowerRateSpec.lean`.
- Tests: `JapanTaxLaw/GeneralTariffLowerRateTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-general-tariff-lower-rate.md`.
- NOT MODELLED: goods recognition, tariff table/treaty lookup, dumping finding, customs procedure.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
