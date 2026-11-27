import JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMore

/-
# LocalTax8_2SuccessorMunicipalitiesTwoOrMoreSpec — independent spec for 地方税法 Num 8_2/2

Needle 「前項の規定によつて消滅市町村の徴収金に係る権利を承継する承継市町村が二以上ある場合において、当該承継市町村がそれぞれ承継すべき当該消滅市町村の徴収金に係る権利について当該承継市町村の長の間において意見を異にし、その協議がととのわないときは、道府県知事（当該承継市町村が二以上の道府県の区域にわたる場合においては、総務大臣）に対し、その決定を求める旨を申し出なければならない。」.
The implementation uses `threshold ≤ municipalities`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ municipalities`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMore

open JapanTaxLaw.TaxFinance

def specInScope (municipalities : Nat) : Prop := 2 ≤ municipalities

theorem agree_scope (municipalities : Nat) : inScope municipalities ↔ specInScope municipalities := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMore
