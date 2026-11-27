import JapanTaxLaw.LocalTax321_15DecisionWithin60Days

/-
# LocalTax321_15DecisionWithin60DaysSpec — independent spec for 地方税法 Num 321_15/7

Needle 「総務大臣は、第四項の申出を受けた場合においては、その日から六十日以内にその裁決をしなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 60`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax321_15DecisionWithin60Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 60

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax321_15DecisionWithin60Days
