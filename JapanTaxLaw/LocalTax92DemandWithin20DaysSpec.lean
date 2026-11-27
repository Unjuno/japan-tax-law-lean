import JapanTaxLaw.LocalTax92DemandWithin20Days

/-
# LocalTax92DemandWithin20DaysSpec — independent spec for 地方税法 Num 92/1

Needle 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下ゴルフ場利用税について同じ。）までにゴルフ場利用税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 20`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax92DemandWithin20Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 20

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax92DemandWithin20Days
