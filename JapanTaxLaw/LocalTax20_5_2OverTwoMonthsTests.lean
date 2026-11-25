import JapanTaxLaw.LocalTax20_5_2OverTwoMonthsSpec

/- Kernel-decided boundary checks for 「当該理由がなくなつた日から二月を超えてはならない」. -/
namespace JapanTaxLaw.LocalTax20_5_2OverTwoMonths

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 2 := by unfold inScope threshold; decide
example : inScope 3 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = false := by decide
example : inScopeBool 3 = true := by decide
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax20_5_2OverTwoMonths
