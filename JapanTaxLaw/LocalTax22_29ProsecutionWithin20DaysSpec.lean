import JapanTaxLaw.LocalTax22_29ProsecutionWithin20Days

/-
# LocalTax22_29ProsecutionWithin20DaysSpec — independent spec for 地方税法 Num 22_29/1

Needle 「地方団体の長は、犯則者が前条第一項の通告（同条第三項の規定による更正があつた場合には、当該更正。以下この条において「通告等」という。）を受けた場合において、当該通告等を受けた日の翌日から起算して二十日以内に当該通告の旨を履行しないときは、検察官に告発しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 20`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax22_29ProsecutionWithin20Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 20

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax22_29ProsecutionWithin20Days
