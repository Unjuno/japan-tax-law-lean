import JapanTaxLaw.LocalTax154DisplacementOver6L

/- Independent spec for 「（１０）　総排気量が六リットルを超えるもの」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax154DisplacementOver6L

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount > 6

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax154DisplacementOver6L
