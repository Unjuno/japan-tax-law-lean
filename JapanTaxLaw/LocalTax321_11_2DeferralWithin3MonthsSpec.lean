import JapanTaxLaw.LocalTax321_11_2DeferralWithin3Months

/-
# LocalTax321_11_2DeferralWithin3MonthsSpec — independent spec for 地方税法 第三百二十一条の十一の二(2)

Needle 「その猶予の期間が三月以内である場合」.
The independent spec states the inclusive deferral-period ceiling directly as
`months ≤ 3` from statutory literals only, with no implementation identifier.
Universal axiom-free bridge by `rfl`. 「以内」/「以下」 is INCLUSIVE: 3 months
qualifies, 4 months is outside.
-/
namespace JapanTaxLaw.LocalTax321_11_2DeferralWithin3Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 3

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax321_11_2DeferralWithin3Months
