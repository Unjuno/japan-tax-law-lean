import JapanTaxLaw.LocalTax433DecisionWithin30DaysSpec

/- Kernel-decided boundary checks for 「固定資産評価審査委員会は、前条第一項の審査の申出を受けた場合においては、直ちにその必要と認める調査その他事実審査を行い、その申出を受けた日から三十日以内に審査の決定をしなければならない。」. -/
namespace JapanTaxLaw.LocalTax433DecisionWithin30Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 29 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 30 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 31 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 29 = true := by decide  -- bool
example : inScopeBool 30 = true := by decide  -- bool
example : inScopeBool 31 = false := by decide  -- bool
example : inScope 30 ↔ specInScope 30 := agree_scope 30
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax433DecisionWithin30Days
