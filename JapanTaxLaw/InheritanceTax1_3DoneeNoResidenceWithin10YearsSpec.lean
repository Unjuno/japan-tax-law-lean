import JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10Years

/-
# InheritanceTax1_3DoneeNoResidenceWithin10YearsSpec — independent spec for 相続税法 Num 1_3/2/2

Needle 「ただし、当該受贈者が同条第一項の規定の適用に係る贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがない場合は、この限りでない。」.
The implementation uses `years ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `years ≤ 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 10

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax1_3DoneeNoResidenceWithin10Years
