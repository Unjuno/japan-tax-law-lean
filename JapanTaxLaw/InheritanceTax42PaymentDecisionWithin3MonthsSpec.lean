import JapanTaxLaw.InheritanceTax42PaymentDecisionWithin3Months

/-
# InheritanceTax42PaymentDecisionWithin3MonthsSpec — independent spec for 相続税法 Num 42/2

Needle 「税務署長は、前項の規定による申請書の提出があつた場合においては、当該申請者及び当該申請に係る事項について前条の規定に該当するか否かの調査を行い、その調査に基づき、当該申請書の提出期限の翌日から起算して三月以内に当該申請に係る税額の全部又は一部について物納財産ごとに当該申請に係る物納の許可をし、又は当該申請の却下をする。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.InheritanceTax42PaymentDecisionWithin3Months

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 3

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax42PaymentDecisionWithin3Months
