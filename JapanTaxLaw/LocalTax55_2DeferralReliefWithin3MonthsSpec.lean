import JapanTaxLaw.LocalTax55_2DeferralReliefWithin3Months

/-
# LocalTax55_2DeferralReliefWithin3MonthsSpec — independent spec for 地方税法 Num 55_2/2

Needle 「ただし、その猶予に係る税額が百万円以下である場合、その猶予の期間が三月以内である場合又は担保を徴することができない特別の事情がある場合は、この限りでない。」.
The implementation uses `months <= 3`; this independent spec states the
statutory INCLUSIVE boundary as `months <= 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax55_2DeferralReliefWithin3Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months <= 3

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax55_2DeferralReliefWithin3Months
