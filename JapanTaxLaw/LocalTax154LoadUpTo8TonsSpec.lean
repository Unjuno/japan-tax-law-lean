import JapanTaxLaw.LocalTax154LoadUpTo8Tons

/- Independent spec for 「最大積載量が八トン以下のもの」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.LocalTax154LoadUpTo8Tons

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≤ 8

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax154LoadUpTo8Tons
