import JapanTaxLaw.LocalTax154PassengersUpTo30Spec

/- Kernel-decided boundary checks for 「（ｉ）　乗車定員が三十人以下のもの」. -/
namespace JapanTaxLaw.LocalTax154PassengersUpTo30

open JapanTaxLaw.TaxFinance

example : inScope 29 := by unfold inScope threshold; decide
example : inScope 30 := by unfold inScope threshold; decide
example : ¬ inScope 31 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 29 = true := by decide
example : inScopeBool 30 = true := by decide
example : inScopeBool 31 = false := by decide
example : inScope 30 ↔ specInScope 30 := agree_scope 30
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax154PassengersUpTo30
