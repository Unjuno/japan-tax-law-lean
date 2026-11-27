import JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonths

/-
# LocalTax72_40DecisionWithinThreeMonthsSpec — independent spec for 地方税法 Num 72_40/1

Needle 「この場合において、正当な事由がなくて当該税務官署が当該更正又は決定の請求を受けた日から三月以内に更正又は決定をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正又は決定をすべき旨を請求することができる。」.
The implementation uses `months ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `months ≤ 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonths

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 3

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonths
