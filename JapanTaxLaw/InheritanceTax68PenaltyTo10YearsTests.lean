import JapanTaxLaw.InheritanceTax68PenaltyTo10YearsSpec

/- Kernel-decided boundary checks for 「偽りその他不正の行為により相続税又は贈与税を免れた者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」. -/
namespace JapanTaxLaw.InheritanceTax68PenaltyTo10Years

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 9 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 10 := by unfold inScope threshold; decide  -- threshold_at
example : ¬ inScope 11 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 9 = true := by decide  -- threshold_below
example : inScopeBool 10 = true := by decide  -- threshold_at
example : inScopeBool 11 = false := by decide  -- threshold_above
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax68PenaltyTo10Years
