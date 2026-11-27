import JapanTaxLaw.LocalTax433ReviewNoticeWithin10DaysSpec

/- Kernel-decided boundary checks for 「固定資産評価審査委員会は、第一項の規定による決定をした場合においては、その決定のあつた日から十日以内に、これを審査を申し出た者及び市町村長に文書をもつて通知しなければならない。」. -/
namespace JapanTaxLaw.LocalTax433ReviewNoticeWithin10Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 9 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 10 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 11 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 9 = true := by decide  -- bool
example : inScopeBool 10 = true := by decide  -- bool
example : inScopeBool 11 = false := by decide  -- bool
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax433ReviewNoticeWithin10Days
