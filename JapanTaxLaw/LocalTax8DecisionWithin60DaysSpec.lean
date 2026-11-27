import JapanTaxLaw.LocalTax8DecisionWithin60Days

/-
# LocalTax8DecisionWithin60DaysSpec — independent spec for 地方税法 Num 8/2

Needle 「総務大臣又は道府県知事は、前項の決定を求める旨の申出を受けた場合においては、その申出を受けた日から六十日以内に決定をし、遅滞なく、その旨を関係地方団体の長に通知しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 60`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax8DecisionWithin60Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 60

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax8DecisionWithin60Days
