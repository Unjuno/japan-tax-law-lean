import JapanTaxLaw.InheritanceTax1_4TenYearLookbackReference

/-
# InheritanceTax1_4TenYearLookbackReferenceSpec — independent spec for 相続税法 Num 1_4/3/3

Needle 「贈与の時においてこの法律の施行地に住所を有していなかつた当該贈与をした者であつて、当該贈与前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもののうちそのいずれの時においても日本国籍を有していなかつたもの又は当該贈与前十年以内のいずれの時においてもこの法律の施行地に住所を有していたことがないものをいう。」.
The implementation uses `years ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `years ≤ 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.InheritanceTax1_4TenYearLookbackReference

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 10

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax1_4TenYearLookbackReference
