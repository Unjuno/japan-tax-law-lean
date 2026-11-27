import JapanTaxLaw.LocalTax701_16BathingTaxDemandWithin20Days

/-
# LocalTax701_16BathingTaxDemandWithin20DaysSpec — independent spec for 地方税法 art. 701_16(1)

Needle 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下入湯税について同じ。）までに入湯税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states the statutory
INCLUSIVE ceiling as `days ≤ 20`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax701_16BathingTaxDemandWithin20Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 20

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax701_16BathingTaxDemandWithin20Days
