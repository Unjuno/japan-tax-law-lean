import JapanTaxLaw.LocalTax8AppealWithin30Days

/-
# LocalTax8AppealWithin30DaysSpec — independent spec for 地方税法 Num 8/4

Needle 「第二項の規定による道府県知事の決定に不服がある市町村長は、同項の通知を受けた日から三十日以内に総務大臣に裁決を求める旨を申し出ることができる。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax8AppealWithin30Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 30

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax8AppealWithin30Days
