import JapanTaxLaw.LocalTax349Population200k

/- Independent spec for 「人口二十万人以上の市」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax349Population200k

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≥ 200_000

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax349Population200k
