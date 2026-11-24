import JapanTaxLaw.InheritanceGiftRateOver30MSpec

/-
# InheritanceGiftRateOver30MTests — kernel-decided boundary checks, 「三千万円を超える金額」
-/

namespace JapanTaxLaw.InheritanceGiftRateOver30M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : ¬ inScope 29_999_999 := by unfold inScope threshold; decide
example : ¬ inScope 30_000_000 := by unfold inScope threshold; decide
example : inScope 30_000_001 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 29_999_999 = false := by decide
example : inScopeBool 30_000_000 = false := by decide
example : inScopeBool 30_000_001 = true := by decide
example : inScope 30_000_001 ↔ specInScope 30_000_001 := agree_scope 30_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceGiftRateOver30M
