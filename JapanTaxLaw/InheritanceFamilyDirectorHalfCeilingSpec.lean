import JapanTaxLaw.InheritanceFamilyDirectorHalfCeiling

/-
# InheritanceFamilyDirectorHalfCeilingSpec — independent spec for 相続税法 Num 66_2/2

Needle 「被相続人の相続開始の直前における当該被相続人に係る同族理事の数の理事の総数のうちに占める割合が二分の一を超えること。」.
The implementation uses `2 * familyDirectors > allDirectors`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.InheritanceFamilyDirectorHalfCeiling

open JapanTaxLaw.TaxFinance

def specInScope (familyDirectors allDirectors : Nat) : Prop := 2 * familyDirectors > allDirectors

theorem agree_scope (familyDirectors allDirectors : Nat) : inScope familyDirectors allDirectors ↔ specInScope familyDirectors allDirectors := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.InheritanceFamilyDirectorHalfCeiling
