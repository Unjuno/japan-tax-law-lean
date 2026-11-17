import JapanTaxLaw.SpecialMeasuresMisc

/-!
# SpecialMeasuresMiscTests — 租税特別措置法 art. 29の4 / 36 / 37の15 / 41の10 smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

NOT MODELLED: art. 29の4（みなし規定・数式なし）, art. 37の15(1)（免税宣言・数式なし）.

-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 41の10(1): 給付補塡金等の分離課税 15%
example : benefitSupplementSeparateRate.num = 15 := by decide
example : benefitSupplementSeparateRate.den = 100 := by decide
example : benefitSupplementSeparateTax 1_000_000 = 150_000 := by decide
example : benefitSupplementSeparateTax 100 = 15 := by decide
example : benefitSupplementSeparateTax 1 = 0 := by decide
example : benefitSupplementSeparateTax 0 = 0 := by decide

-- art. 36: 通じて五千万円の範囲内（cap）
example : assetTransferDeductionCeiling = 50_000_000 := by decide
example : assetTransferDeductionCapped 0 = 0 := by decide
example : assetTransferDeductionCapped 20_000_000 = 20_000_000 := by decide
example : assetTransferDeductionCapped 50_000_000 = 50_000_000 := by decide
example : assetTransferDeductionCapped 50_000_001 = 50_000_000 := by decide
example : assetTransferDeductionCapped 999_999_999 = 50_000_000 := by decide

-- art. 37の15(2): 不足額をないものとみなす（saturating Nat 減算）
example : lendingTrustGain 10_000_000 6_000_000 = 4_000_000 := by decide
example : lendingTrustGain 6_000_000 10_000_000 = 0 := by decide
example : lendingTrustGain 5_000 5_000 = 0 := by decide
example : lendingTrustGain 0 0 = 0 := by decide
example : lendingTrustGain 0 5_000 = 0 := by decide

end JapanTaxLaw
