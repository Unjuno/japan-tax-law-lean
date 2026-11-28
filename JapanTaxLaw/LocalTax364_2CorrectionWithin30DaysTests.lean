import JapanTaxLaw.LocalTax364_2CorrectionWithin30DaysSpec

/- Kernel-decided boundary checks for 「前条第五項の固定資産に係る当該年度分の固定資産税額が仮算定税額の二分の一に相当する額に満たないこととなると認められる場合においては、同項の規定によつて当該固定資産に係る固定資産税を徴収されることとなる者は、同条第七項の納税通知書の交付を受けた日から三十日以内に市町村長に同条第五項の規定によつて徴収される固定資産税額の修正を申し出ることができる。」. -/
namespace JapanTaxLaw.LocalTax364_2CorrectionWithin30Days

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 29 = true := by decide  -- threshold_below
example : inScopeBool 30 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 31 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 30 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 31 := by unfold inScope; decide  -- outside (Prop)
example : inScope 30 ↔ specInScope 30 := agree_scope 30
example (days : Nat) : inScope days ↔ specInScope days := agree_scope days

end JapanTaxLaw.LocalTax364_2CorrectionWithin30Days
