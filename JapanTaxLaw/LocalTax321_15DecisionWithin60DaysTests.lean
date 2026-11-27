import JapanTaxLaw.LocalTax321_15DecisionWithin60DaysSpec

/- Kernel-decided boundary checks for 「総務大臣は、第四項の申出を受けた場合においては、その日から六十日以内にその裁決をしなければならない。」. -/
namespace JapanTaxLaw.LocalTax321_15DecisionWithin60Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 59 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 60 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 61 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 59 = true := by decide  -- bool
example : inScopeBool 60 = true := by decide  -- bool
example : inScopeBool 61 = false := by decide  -- bool
example : inScope 60 ↔ specInScope 60 := agree_scope 60
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax321_15DecisionWithin60Days
