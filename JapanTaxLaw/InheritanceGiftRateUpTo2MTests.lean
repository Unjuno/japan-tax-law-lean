import JapanTaxLaw.InheritanceGiftRateUpTo2MSpec

/-
# InheritanceGiftRateUpTo2MTests — kernel-decided boundary checks, 「二百万円以下の金額」
-/

namespace JapanTaxLaw.InheritanceGiftRateUpTo2M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide
example : inScope 1 := by unfold inScope threshold; decide
example : inScope 1_999_999 := by unfold inScope threshold; decide
example : inScope 2_000_000 := by unfold inScope threshold; decide
example : ¬ inScope 2_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = true := by decide
example : inScopeBool 1 = true := by decide
example : inScopeBool 1_999_999 = true := by decide
example : inScopeBool 2_000_000 = true := by decide
example : inScopeBool 2_000_001 = false := by decide
example : inScope 2_000_000 ↔ specInScope 2_000_000 := agree_scope 2_000_000
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceGiftRateUpTo2M
