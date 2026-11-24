# STAGING: RndSurchargeRate

- Normative id: NORM|b1aa09eb096d7d23f144edb485e04f1792ac94e62641d6b3a1f14cf170de0250
- Law: 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013, art. 10(3)(3)
- Clause: 当該試験研究費割合から百分の十を控除した割合に二を乗じて計算した割合（当該割合に小数点以下三位未満の端数があるときはこれを切り捨てた割合とし、当該計算した割合が百分の十を超えるときは百分の十とする。）
- Model: bounded integer slice; 10% cap and three-decimal truncation modelled separately.
- Independent spec: `JapanTaxLaw/RndSurchargeRateSpec.lean` (multiplication/division/min).
- Implementation: `JapanTaxLaw/RndSurchargeRate.lean` (addition/modulo/conditional).
- Tests: `JapanTaxLaw/RndSurchargeRateTests.lean` (six kernel-decided boundary examples).
- Review: `docs/adversarial/reviews-rnd-surcharge.md`.
- NOT MODELLED: 試験研究費割合・控除対象試験研究費の算定、他号・他項、
  法人税額への乗算、適用年度・認定要件。
- Status axes: 技術的検証済み（kernel build待ち）/ 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
