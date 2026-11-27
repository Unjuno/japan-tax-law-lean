import JapanTaxLaw.LocalTax433ReviewNoticeWithin10Days

/-
# LocalTax433ReviewNoticeWithin10DaysSpec — independent spec for 地方税法 Num 433/12

Needle 「固定資産評価審査委員会は、第一項の規定による決定をした場合においては、その決定のあつた日から十日以内に、これを審査を申し出た者及び市町村長に文書をもつて通知しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax433ReviewNoticeWithin10Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 10

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax433ReviewNoticeWithin10Days
