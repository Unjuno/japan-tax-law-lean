import JapanTaxLaw.LocalTax154LoadOver8Tons

/- Independent spec for 「（９）　最大積載量が八トンを超えるもの」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax154LoadOver8Tons

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := 8 < amount

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax154LoadOver8Tons
