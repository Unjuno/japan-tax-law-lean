import JapanTaxLaw.LocalTax389TwoMunicipalitiesMovable

/- Independent spec for 「総務省令で定める船舶、車両その他の移動性償却資産又は可動性償却資産で二以上の市町村にわたつて使用されるもののうち総務大臣が指定するもの」:
statutory literals only, no impl identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax389TwoMunicipalitiesMovable

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 2

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax389TwoMunicipalitiesMovable
