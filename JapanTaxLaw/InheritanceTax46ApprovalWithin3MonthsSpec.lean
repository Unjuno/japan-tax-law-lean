import JapanTaxLaw.InheritanceTax46ApprovalWithin3Months

/-
# InheritanceTax46ApprovalWithin3MonthsSpec — independent spec for 相続税法 Num 46/3

Needle 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について第一項の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出があつた日の翌日から起算して三月以内に当該申請の承認をし、又は当該申請の却下をする。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.InheritanceTax46ApprovalWithin3Months

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 3

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax46ApprovalWithin3Months
