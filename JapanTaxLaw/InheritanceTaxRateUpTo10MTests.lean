import JapanTaxLaw.InheritanceTaxRateUpTo10MSpec

/-
# InheritanceTaxRateUpTo10MTests — kernel-decided boundary checks, 「千万円以下の金額」
-/

namespace JapanTaxLaw.InheritanceTaxRateUpTo10M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 9_999_999 := by unfold inScope threshold; decide
example : inScope 10_000_000 := by unfold inScope threshold; decide
example : ¬ inScope 10_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 9_999_999 = true := by decide
example : inScopeBool 10_000_000 = true := by decide
example : inScopeBool 10_000_001 = false := by decide
example : inScope 10_000_000 ↔ specInScope 10_000_000 := agree_scope 10_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTaxRateUpTo10M
