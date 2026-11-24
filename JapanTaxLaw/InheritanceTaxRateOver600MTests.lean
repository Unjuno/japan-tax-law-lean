import JapanTaxLaw.InheritanceTaxRateOver600MSpec

/-
# InheritanceTaxRateOver600MTests — kernel-decided boundary checks, 「六億円を超える金額」
-/

namespace JapanTaxLaw.InheritanceTaxRateOver600M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 599_999_999 := by unfold inScope threshold; decide
example : ¬ inScope 600_000_000 := by unfold inScope threshold; decide
example : inScope 600_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 599_999_999 = false := by decide
example : inScopeBool 600_000_000 = false := by decide
example : inScopeBool 600_000_001 = true := by decide
example : inScope 600_000_001 ↔ specInScope 600_000_001 := agree_scope 600_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTaxRateOver600M
