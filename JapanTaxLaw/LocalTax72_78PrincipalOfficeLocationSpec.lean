import JapanTaxLaw.LocalTax72_78PrincipalOfficeLocation

/- Independent spec for 「その事務所等の所在地（その事務所等が二以上ある場合には、主たるものの所在地）」: statutory literals only, no implementation
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax72_78PrincipalOfficeLocation

open JapanTaxLaw.TaxFinance

/-- Independently transcribed statutory condition (literals only). -/
def specInScope (amount : Nat) : Prop := 2 ≤ amount

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower threshold
  rfl

end JapanTaxLaw.LocalTax72_78PrincipalOfficeLocation
