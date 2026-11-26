import JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeilingSpec

/- Kernel-decided boundary checks for 「都市計画税の税率が百分の〇・三（千分の三）を超えること」. -/
namespace JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeiling

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 2 := by unfold inScope threshold; decide  -- below_threshold
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- threshold_at (超え strict)
example : inScope 4 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = false := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScopeBool 4 = true := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax702_4UrbanPlanningTaxRateCeiling
