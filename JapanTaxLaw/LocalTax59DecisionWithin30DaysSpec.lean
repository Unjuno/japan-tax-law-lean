import JapanTaxLaw.LocalTax59DecisionWithin30Days

/-
# LocalTax59DecisionWithin30DaysSpec — independent spec for 地方税法 Num 59(2)

Needle 「総務大臣は、前項の申出を受けた場合においては、その申出を受けた日から三十日以内に、その決定をしなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the 三十日以内 upper bound on the decision period as `days ≤ 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax59DecisionWithin30Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 30

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax59DecisionWithin30Days
