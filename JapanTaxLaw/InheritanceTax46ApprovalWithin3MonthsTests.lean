import JapanTaxLaw.InheritanceTax46ApprovalWithin3MonthsSpec

/- Kernel-decided boundary checks for 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について第一項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出があつた日の翌日から起算して三月以内に当該申請の承認をし、又は当該申請の却下をする。」. -/
namespace JapanTaxLaw.InheritanceTax46ApprovalWithin3Months

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScopeBool 4 = false := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.InheritanceTax46ApprovalWithin3Months
