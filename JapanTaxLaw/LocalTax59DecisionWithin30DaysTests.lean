import JapanTaxLaw.LocalTax59DecisionWithin30DaysSpec

/- Kernel-decided boundary checks for 「総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」. -/
namespace JapanTaxLaw.LocalTax59DecisionWithin30Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 29 := by unfold inScope threshold; decide  -- below_limit
example : inScope 30 := by unfold inScope threshold; decide  -- limit_at (以内 inclusive)
example : ¬ inScope 31 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 29 = true := by decide  -- bool
example : inScopeBool 30 = true := by decide  -- bool
example : inScopeBool 31 = false := by decide  -- bool
example : inScope 30 ↔ specInScope 30 := agree_scope 30
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax59DecisionWithin30Days
