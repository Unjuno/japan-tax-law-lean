import JapanTaxLaw.GiftAnnualExemption

/-!
# GiftAnnualExemptionTests — 相続税法 art. 21の11の二(1) kernel-decided checks

Decidable smoke tests, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 21の11の二(1): 控除後課税価格 = saturating(課税価格 − 六十万円)
example : giftAnnualExemptionLimit = 600_000 := by rfl
example : giftAnnualExemptionBase 0 = 0 := by decide
example : giftAnnualExemptionBase 1 = 0 := by decide
example : giftAnnualExemptionBase 599_999 = 0 := by decide
example : giftAnnualExemptionBase 600_000 = 0 := by decide
example : giftAnnualExemptionBase 600_001 = 1 := by decide
-- boundary values 11 / 12 / 13 appear in the cases below
example : giftAnnualExemptionBase 611_012 = 11_012 := by decide
example : giftAnnualExemptionBase 1_200_000 = 600_000 := by decide
example : giftAnnualExemptionBase 13_000_000 = 12_400_000 := by decide

end JapanTaxLaw
