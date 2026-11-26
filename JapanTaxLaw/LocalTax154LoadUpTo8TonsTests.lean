import JapanTaxLaw.LocalTax154LoadUpTo8TonsSpec

/- Kernel-decided boundary checks for 「最大積載量が八トン以下のもの」. -/
namespace JapanTaxLaw.LocalTax154LoadUpTo8Tons

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 7 := by unfold inScope threshold; decide
example : inScope 8 := by unfold inScope threshold; decide
example : ¬ inScope 9 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 7 = true := by decide
example : inScopeBool 8 = true := by decide
example : inScopeBool 9 = false := by decide
example : inScope 8 ↔ specInScope 8 := agree_scope 8
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax154LoadUpTo8Tons
