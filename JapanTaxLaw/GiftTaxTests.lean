import JapanTaxLaw.GiftTax

/-!
# GiftTax tests — 相続税法 art. 21-5/21-7 smoke checks

Decidable smoke tests for the gift-tax rate model, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 21-7 boundary checks (band-cumulative totals)
example : giftPortionTax 0 = 0 := by decide
example : giftPortionTax 2_000_000 = 200_000 := by decide
example : giftPortionTax 3_000_000 = 350_000 := by decide
example : giftPortionTax 4_000_000 = 550_000 := by decide
example : giftPortionTax 6_000_000 = 1_150_000 := by decide
example : giftPortionTax 10_000_000 = 2_750_000 := by decide
example : giftPortionTax 15_000_000 = 5_000_000 := by decide
example : giftPortionTax 30_000_000 = 12_500_000 := by decide
example : giftPortionTax 40_000_000 = 18_000_000 := by decide

-- art. 21-5 basic deduction
example : giftBasicDeduction = 600_000 := by decide
example : giftTax 0 = 0 := by decide
example : giftTax 600_000 = 0 := by decide
example : giftTax 600_001 = 0 := by decide  -- one yen above deduction, 0-rate band too low to matter but still positive
example : giftTax 1_000_000 = giftPortionTax 400_000 := by decide

-- composite example, taxable residual
example : giftTax 3_000_000 = giftPortionTax 2_400_000 := by decide

end JapanTaxLaw
