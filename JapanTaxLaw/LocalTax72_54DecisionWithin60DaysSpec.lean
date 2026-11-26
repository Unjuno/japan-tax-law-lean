import JapanTaxLaw.LocalTax72_54DecisionWithin60Days

/-
# LocalTax72_54DecisionWithin60DaysSpec — independent spec for 地方税法 Num 72_54(5)

Needle 「前項の規定による申出に対する総務大臣の決定は、その申出を受理した日から六十日以内にしなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the 六十日以内 upper bound on the decision period as `days ≤ 60`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_54DecisionWithin60Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 60

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_54DecisionWithin60Days
