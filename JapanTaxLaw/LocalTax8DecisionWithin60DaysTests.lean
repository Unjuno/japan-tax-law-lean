import JapanTaxLaw.LocalTax8DecisionWithin60DaysSpec

/- Kernel-decided boundary checks for 「総務大臣又は道府県知事は、前項の決定を求める旨の申出を受けた場合においては、その申出を受けた日から六十日以内に決定をし、遅滞なく、その旨を関係地方団体の長に通知しなければならない。」. -/
namespace JapanTaxLaw.LocalTax8DecisionWithin60Days

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

end JapanTaxLaw.LocalTax8DecisionWithin60Days
