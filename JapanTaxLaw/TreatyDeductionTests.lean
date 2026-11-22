import JapanTaxLaw.TreatyDeduction

/-!
# TreatyDeduction tests — 条約控除 smoke checks
Decidable smoke tests, pinned to law 329AC0000000194 / revision 329AC0000000194_20010106_411AC0000000160.
1000×1/2=500, 1000×3/4=750, den=0→0。
-/

namespace JapanTaxLaw.TreatyDeduction

example : treatyDeduction 1000 1 2 = 500 := by decide
example : treatyDeduction 1000 3 4 = 750 := by decide
example : treatyDeduction 0 1 2 = 0 := by decide
example : treatyDeduction 1000 1 0 = 0 := by decide
example : treatyDeduction 500 2 3 = 333 := by decide

end JapanTaxLaw.TreatyDeduction
