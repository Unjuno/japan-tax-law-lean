import JapanTaxLaw.LocalTax433DecisionWithin30Days

/-
# LocalTax433DecisionWithin30DaysSpec — independent spec for 地方税法 Num 433/1

Needle 「固定資産評価審査委員会は、前条第一項の審査の申出を受けた場合においては、直ちにその必要と認める調査その他事実審査を行い、その申出を受けた日から三十日以内に審査の決定をしなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax433DecisionWithin30Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 30

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax433DecisionWithin30Days
