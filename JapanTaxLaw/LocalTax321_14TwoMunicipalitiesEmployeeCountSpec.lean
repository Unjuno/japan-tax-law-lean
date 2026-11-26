import JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCount

/- Independent spec for 「（二以上の市町村において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCount

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCount
