import JapanTaxLaw.LocalTax37_2Over40MSpec

/-
# LocalTax37_2Over40MTests — kernel-decided boundary checks, 「四千万円を超える金額」
-/

namespace JapanTaxLaw.LocalTax37_2Over40M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 39_999_999 := by unfold inScope threshold; decide
example : ¬ inScope 40_000_000 := by unfold inScope threshold; decide
example : inScope 40_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 39_999_999 = false := by decide
example : inScopeBool 40_000_000 = false := by decide
example : inScopeBool 40_000_001 = true := by decide
example : inScope 40_000_001 ↔ specInScope 40_000_001 := agree_scope 40_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax37_2Over40M
