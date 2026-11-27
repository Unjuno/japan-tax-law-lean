import JapanTaxLaw.LocalTax144_30NotificationWithin60Days

/-
# LocalTax144_30NotificationWithin60DaysSpec — independent spec for 地方税法 Num 144_30/3

Needle 「道府県知事は、第一項の規定による申請を受理した場合においては、同項又は前項に規定する措置を採るかどうかについて、その申請を受理した日から六十日以内に特別徴収義務者に通知しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 60`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax144_30NotificationWithin60Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 60

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax144_30NotificationWithin60Days
