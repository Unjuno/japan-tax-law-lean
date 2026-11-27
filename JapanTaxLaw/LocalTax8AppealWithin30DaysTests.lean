import JapanTaxLaw.LocalTax8AppealWithin30DaysSpec

/- Kernel-decided boundary checks for 「第二項の規定による道府県知事の決定に不服がある市町村長は、同項の通知を受けた日から三十日以内に総務大臣に裁決を求める旨を申し出ることができる。」. -/
namespace JapanTaxLaw.LocalTax8AppealWithin30Days

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

end JapanTaxLaw.LocalTax8AppealWithin30Days
