import JapanTaxLaw.LocalTax693MunicipalExternalTaxDemandWithin20Days

/-
# LocalTax693MunicipalExternalTaxDemandWithin20DaysSpec — independent spec for 地方税法 Num 693/1

Needle 「納税者又は特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下市町村法定外普通税について同様とする。）までに市町村法定外普通税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 20`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax693MunicipalExternalTaxDemandWithin20Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 20

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax693MunicipalExternalTaxDemandWithin20Days
