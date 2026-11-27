import JapanTaxLaw.LocalTax400RegisterWithin10DaysSpec

/- Kernel-decided boundary checks for 「市町村長は、前条の規定による通知を受けた場合においては、その通知を受けた日から十日以内に道府県知事又は総務大臣の決定に係る当該価格等を固定資産課税台帳に登録しなければならない。」. -/
namespace JapanTaxLaw.LocalTax400RegisterWithin10Days

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

end JapanTaxLaw.LocalTax400RegisterWithin10Days
