import JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointment

/-
# LocalTax404TwoMunicipalitiesJointAppointmentSpec — independent spec for 地方税法 Num 404/3

Needle 「二以上の市町村の長は、当該市町村の議会の同意を得て、その協議によつて協同して同一の者を当該各市町村の固定資産評価員に選任することができる。」.
The implementation uses `threshold ≤ municipalities`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ municipalities`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointment

open JapanTaxLaw.TaxFinance

def specInScope (municipalities : Nat) : Prop := 2 ≤ municipalities

theorem agree_scope (municipalities : Nat) : inScope municipalities ↔ specInScope municipalities := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax404TwoMunicipalitiesJointAppointment
