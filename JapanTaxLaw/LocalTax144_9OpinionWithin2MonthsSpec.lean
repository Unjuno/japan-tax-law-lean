import JapanTaxLaw.LocalTax144_9OpinionWithin2Months

/-
# LocalTax144_9OpinionWithin2MonthsSpec — independent spec for 地方税法 Num 144_9(5)

Needle 「ただし、関係道府県知事と意見を異にする場合においては、当該書類を受け取つた日から二月以内に、自己の意見を付して、当該書類を総務大臣に送付するとともに、その指示を求めなければならない。」.
The implementation uses `≤ threshold months`; the independent spec states the same
inclusive bound as `≤ 2 months`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax144_9OpinionWithin2Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 2

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax144_9OpinionWithin2Months
