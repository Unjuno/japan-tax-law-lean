import JapanTaxLaw.ElderlySpouseDeduction

/-!
# ElderlySpouseDeduction tests — 老人配偶者控除 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
900万以下10万/900〜950万6万/950〜1000万3万。
-/

namespace JapanTaxLaw.ElderlySpouseDeduction

example : deduction 9000000 = 100000 := by decide
example : deduction 9000001 = 60000 := by decide
example : deduction 9500001 = 30000 := by decide

end JapanTaxLaw.ElderlySpouseDeduction
