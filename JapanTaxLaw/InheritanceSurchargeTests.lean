import JapanTaxLaw.InheritanceSurcharge

/-!
# InheritanceSurcharge tests — 相続税法 art. 18 smoke checks

Decidable smoke tests for the art. 18 相続税額の加算 model, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 18(1): non-eligible heir pays base + 20%
example : surcharge20 100 = 20 := by decide
example : surcharge20 1_000 = 200 := by decide
example : taxWithSurcharge false 0 = 0 := by decide
example : taxWithSurcharge false 125 = 150 := by decide
example : taxWithSurcharge false 1_000_000 = 1_200_000 := by decide

-- eligible heir: no surcharge
example : taxWithSurcharge true 0 = 0 := by decide
example : taxWithSurcharge true 1_000_000 = 1_000_000 := by decide
example : taxWithSurcharge true 2_750_000 = 2_750_000 := by decide

-- small sample
example : taxWithSurcharge true 4_500 = 4_500 := by decide
example : taxWithSurcharge false 4_500 = 5_400 := by decide

end JapanTaxLaw
