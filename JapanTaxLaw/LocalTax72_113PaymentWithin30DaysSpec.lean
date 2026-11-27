import JapanTaxLaw.LocalTax72_113PaymentWithin30Days

/-
# LocalTax72_113PaymentWithin30DaysSpec — independent spec for 地方税法 Num 72_113/3

Needle 「道府県知事は、前項の規定による通知があつた場合においては、その通知があつた日から三十日以内に、第一項の徴収取扱費を支払うものとする。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_113PaymentWithin30Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 30

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_113PaymentWithin30Days
