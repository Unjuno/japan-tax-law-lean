import JapanTaxLaw.LocalTax349Population200kSpec

/- Kernel-decided boundary checks for 「人口二十万人以上の市」. -/
namespace JapanTaxLaw.LocalTax349Population200k

open JapanTaxLaw.TaxFinance

example : ¬ inScope 199_999 := by unfold inScope threshold; decide
example : inScope 200_000 := by unfold inScope threshold; decide
example : inScope 200_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 199_999 = false := by decide
example : inScopeBool 200_000 = true := by decide
example : inScopeBool 200_001 = true := by decide
example : inScope 200_000 ↔ specInScope 200_000 := agree_scope 200_000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax349Population200k
