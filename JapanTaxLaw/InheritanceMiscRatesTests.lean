import JapanTaxLaw.InheritanceMiscRates

/-!
# InheritanceMiscRates tests — 相続税法 art. 21の十三 / art. 26 / art. 17 smoke checks

Decidable smoke tests, pinned to

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 21の十三: 控除後課税価格 × 20/100（切り捨て）
example : inheritanceSettlementGiftTax 1_000_000 = 200_000 := by decide
example : inheritanceSettlementGiftTax 0 = 0 := by decide
example : inheritanceSettlementGiftTax 101 = 20 := by decide

-- art. 26: 時価 × 85/100（切り捨て）
example : standingTimberValue 1_000_000 = 850_000 := by decide
example : standingTimberValue 0 = 0 := by decide
example : standingTimberValue 1_000 = 850 := by decide

-- art. 17: 総額 × 割合（caller-established TaxRate、切り捨て）
def heirRatioQuarterTest : TaxRate := ⟨1, 4, by decide⟩   -- 25%
def heirRatioThirdTest : TaxRate := ⟨1, 3, by decide⟩     -- 1/3
example : heirInheritanceTax 1_000_000 heirRatioQuarterTest = 250_000 := by decide
example : heirInheritanceTax 1_000_000 heirRatioThirdTest = 333_333 := by decide
example : heirInheritanceTax 0 heirRatioQuarterTest = 0 := by decide

end JapanTaxLaw
