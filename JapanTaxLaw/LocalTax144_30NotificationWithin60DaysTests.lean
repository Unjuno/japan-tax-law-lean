import JapanTaxLaw.LocalTax144_30NotificationWithin60DaysSpec

/- Kernel-decided boundary checks for 「道府県知事は、第一項の規定による申請を受理した場合においては、同項又は前項に規定する措置を採るかどうかについて、その申請を受理した日から六十日以内に特別徴収義務者に通知しなければならない。」. -/
namespace JapanTaxLaw.LocalTax144_30NotificationWithin60Days

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

end JapanTaxLaw.LocalTax144_30NotificationWithin60Days
