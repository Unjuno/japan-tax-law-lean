import JapanTaxLaw.InheritanceTax47WithdrawalDecisionWithin3MonthsSpec

/- Kernel-decided boundary checks for 「税務署長は、前項の規定による申請書の提出があつた場合においては、その申請の基因となる物納の撤回の申請の却下をする場合を除き、当該申請者及び当該申請に係る事項について前条第一項及び前二項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出期限の翌日から起算して三月以内に当該申請に係る税額の全部又は一部について当該申請に係る条件若しくはこれを変更した条件により物納の撤回に係る延納の許可をし、又は当該申請の却下をする。」. -/
namespace JapanTaxLaw.InheritanceTax47WithdrawalDecisionWithin3Months

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

end JapanTaxLaw.InheritanceTax47WithdrawalDecisionWithin3Months
