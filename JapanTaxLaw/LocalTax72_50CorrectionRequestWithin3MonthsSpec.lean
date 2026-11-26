import JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3Months

/-
# LocalTax72_50CorrectionRequestWithin3MonthsSpec — independent spec for 地方税法 Num 72_50(3)

Needle 「この場合において、正当な事由がなくて当該税務官署が当該更正の請求を受けた日から三月以内に更正をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正をすべき旨を請求することができる。」.
The implementation uses `≤ threshold months`; the independent spec states the same
inclusive bound as `≤ 3 months`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 3

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax72_50CorrectionRequestWithin3Months
