import JapanTaxLaw.CohabitElderlyDependentDeduction

/-!
# CohabitElderlyDependentDeduction tests — 同居老人扶養親族控除 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
一人 13 万円。
-/

namespace JapanTaxLaw.CohabitElderlyDependentDeduction

example : deduction 0 = 0 := by decide
example : deduction 1 = 130000 := by decide
example : deduction 2 = 260000 := by decide

end JapanTaxLaw.CohabitElderlyDependentDeduction
