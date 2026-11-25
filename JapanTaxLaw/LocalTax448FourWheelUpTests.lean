import JapanTaxLaw.LocalTax448FourWheelUpSpec

/- Kernel-decided boundary checks for 「ハ　四輪以上のもの」. -/
namespace JapanTaxLaw.LocalTax448FourWheelUp

open JapanTaxLaw.TaxFinance

example : ¬ inScope 3 := by unfold inScope threshold; decide
example : inScope 4 := by unfold inScope threshold; decide
example : inScope 5 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 3 = false := by decide
example : inScopeBool 4 = true := by decide
example : inScopeBool 5 = true := by decide
example : inScope 4 ↔ specInScope 4 := agree_scope 4
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax448FourWheelUp
