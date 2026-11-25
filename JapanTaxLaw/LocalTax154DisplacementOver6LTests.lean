import JapanTaxLaw.LocalTax154DisplacementOver6LSpec

/- Kernel-decided boundary checks for 「（１０）　総排気量が六リットルを超えるもの」. -/
namespace JapanTaxLaw.LocalTax154DisplacementOver6L

open JapanTaxLaw.TaxFinance

example : ¬ inScope 5 := by unfold inScope threshold; decide
example : ¬ inScope 6 := by unfold inScope threshold; decide
example : inScope 7 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 5 = false := by decide
example : inScopeBool 6 = false := by decide
example : inScopeBool 7 = true := by decide
example : inScope 6 ↔ specInScope 6 := agree_scope 6
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax154DisplacementOver6L
