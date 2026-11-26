import JapanTaxLaw.CohabitantSpecialDisabilityDeduction

/-!
# CohabitantSpecialDisabilityDeduction tests — 同居特別障害者控除 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
一人 22 万円。
-/

namespace JapanTaxLaw.CohabitantSpecialDisabilityDeduction

example : deduction 0 = 0 := by decide
example : deduction 1 = 220000 := by decide
example : deduction 2 = 440000 := by decide

end JapanTaxLaw.CohabitantSpecialDisabilityDeduction
