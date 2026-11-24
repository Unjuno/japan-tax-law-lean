import JapanTaxLaw.InheritanceGiftRate4M6MSpec

/- Kernel-decided boundary checks for 「四百万円を超え六百万円以下の金額」. -/
namespace JapanTaxLaw.InheritanceGiftRate4M6M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower upper; decide
example : ¬ inScope 1 := by unfold inScope lower upper; decide
example : ¬ inScope 3_999_999 := by unfold inScope lower upper; decide
example : ¬ inScope 4_000_000 := by unfold inScope lower upper; decide
example : inScope 4_000_001 := by unfold inScope lower upper; decide
example : inScope 6_000_000 := by unfold inScope lower upper; decide
example : ¬ inScope 6_000_001 := by unfold inScope lower upper; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 3_999_999 = false := by decide
example : inScopeBool 4_000_000 = false := by decide
example : inScopeBool 4_000_001 = true := by decide
example : inScopeBool 6_000_000 = true := by decide
example : inScopeBool 6_000_001 = false := by decide
example : inScope 4_000_001 ↔ specInScope 4_000_001 := agree_scope 4_000_001
example (a : Money) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceGiftRate4M6M
