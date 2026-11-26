import JapanTaxLaw.InheritanceTax49DisclosureWithin2Months

/-
# InheritanceTax49DisclosureWithin2MonthsSpec — independent spec for 相続税法 Num 49(3)

Needle 「第一項の請求があつた場合には、税務署長は、当該請求をした者に対し、当該請求後二月以内に同項の開示をしなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the 二月以内 upper bound on the disclosure period as `days ≤ 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.InheritanceTax49DisclosureWithin2Months

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 2

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax49DisclosureWithin2Months
