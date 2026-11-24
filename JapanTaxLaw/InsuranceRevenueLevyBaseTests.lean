import JapanTaxLaw.InsuranceRevenueLevyBase

/-!
# InsuranceRevenueLevyBase tests — 収入割課税標準 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
収入保険料 × 24%、1円未満切捨て。
-/

namespace JapanTaxLaw.InsuranceRevenueLevyBase

example : levyBase 100 = 24 := by decide
example : levyBase 10000 = 2400 := by decide
example : levyBase 1 = 0 := by decide
example : levyBase 1000000 = 240000 := by decide

end JapanTaxLaw.InsuranceRevenueLevyBase
