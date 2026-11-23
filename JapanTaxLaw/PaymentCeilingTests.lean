import JapanTaxLaw.PaymentCeiling

/-!
# PaymentCeiling tests — 支払上限 smoke checks
Decidable smoke tests, pinned to law 329AC0000000036 / revision 329AC0000000036_20240101_431AC0000000003.
こえてはならない = 以下（境界 100=100 許容）。
-/

namespace JapanTaxLaw.PaymentCeiling

example : orderWithinPlan 0 100 = true := by decide
example : orderWithinPlan 100 100 = true := by decide
example : orderWithinPlan 101 100 = false := by decide

end JapanTaxLaw.PaymentCeiling
