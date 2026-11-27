import JapanTaxLaw.InheritanceTax42CorrectionWithin20DaysSpec

/- Kernel-decided boundary checks for 「第八項の規定により申請書の訂正又は物納手続関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該物納手続関係書類の訂正若しくは提出をしなければならない。」. -/
namespace JapanTaxLaw.InheritanceTax42CorrectionWithin20Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 19 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 20 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 21 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 19 = true := by decide  -- bool
example : inScopeBool 20 = true := by decide  -- bool
example : inScopeBool 21 = false := by decide  -- bool
example : inScope 20 ↔ specInScope 20 := agree_scope 20
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax42CorrectionWithin20Days
