import JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftorsSpec

/- Kernel-decided boundary checks for 「特定贈与者が二人以上ある場合」. -/
namespace JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftors

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : inScope 2 := by unfold inScope threshold; decide
example : inScope 3 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = true := by decide
example : inScopeBool 3 = true := by decide
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTaxArt21_11_2TwoGiftors
