import JapanTaxLaw.InheritanceTax39CorrectionWithin20Days

/-
# InheritanceTax39CorrectionWithin20DaysSpec — independent spec for 相続税法 Num 39(12)

Needle 「第十項の規定により申請書の訂正又は担保提供関係書類の訂正若しくは提出を求められた当該申請者は、前項の規定による通知を受けた日の翌日から起算して二十日以内に当該申請書の訂正又は当該担保提供関係書類の訂正若しくは提出をしなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the 二十日以内 upper bound on the correction/period as `days ≤ 20`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.InheritanceTax39CorrectionWithin20Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 20

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax39CorrectionWithin20Days
